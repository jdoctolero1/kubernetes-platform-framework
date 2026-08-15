module "ec2_control_plane" {
  source = "./modules/ec2"

  name                        = local.kube_cp_name
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = data.aws_subnet.admin_subnet.id
  private_ip                  = var.kube_cp_private_ip
  security_group_ids          = [module.security_group_control_plane.id]
  key_name                    = var.key_name
  associate_public_ip_address = var.vm_associate_public_ip_address
  user_data                   = templatefile("${path.module}/modules/user_data/ec2-kube-cp-ubuntu.yaml", {
    hostname                = local.kube_cp_name
    domain                  = var.private_zone_name
    kube_admin_username     = var.kube_admin_username
    kube_authorized_keys    = var.kube_authorized_keys
  })

  tags = local.tags
}

module "ec2_worker_nodes" {
  source = "./modules/ec2"
  count  = length(var.kube_wn_private_ips)

  name                        = "ec2-${var.environment}-kwn-${var.region_short}-${format("%02d", count.index + 1)}"
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = data.aws_subnet.app_subnet.id
  private_ip                  = var.kube_wn_private_ips[count.index]
  security_group_ids          = [module.security_group_worker_nodes.id]
  key_name                    = var.key_name
  associate_public_ip_address = var.vm_associate_public_ip_address

  user_data                   = templatefile("${path.module}/modules/user_data/ec2-kube-cp-ubuntu.yaml", {
    hostname                = "ec2-${var.environment}-kwn-${var.region_short}-${format("%02d", count.index + 1)}"
    domain                  = var.private_zone_name
    kube_admin_username     = var.kube_admin_username
    kube_authorized_keys    = var.kube_authorized_keys
  })

  tags = local.tags
}

module "route53_a_record" {
  source = "./modules/route53_a_record"

  zone_id      = data.aws_route53_zone.private.zone_id
  record_name  = local.kube_cp_name
  private_ip   = module.ec2_control_plane.private_ip
}

module "route53_worker_a_record" {
  source = "./modules/route53_a_record"
  count  = length(var.kube_wn_private_ips)

  zone_id      = data.aws_route53_zone.private.zone_id
  record_name  = "ec2-${var.environment}-kwn-${var.region_short}-${format("%02d", count.index + 1)}"
  private_ip   = module.ec2_worker_nodes[count.index].private_ip
}

module "alb_kubernetes" {
  source = "./modules/alb"

  name               = "alb-${var.environment}-kube-${var.region_short}-01"
  internal           = false
  security_group_ids = [module.security_group_app_lb.id]
  subnet_ids         = [data.aws_subnet.web_subnet_01.id, data.aws_subnet.web_subnet_02.id]
  vpc_id             = data.aws_vpc.main.id

  target_group_name = "tg-${var.environment}-kube-nodeport-${var.region_short}"
  target_type       = "instance"
  target_port       = var.kube_node_port
  target_protocol   = "HTTP"

  health_check_path      = "/"
  health_check_interval  = 30
  health_check_timeout   = 5
  healthy_threshold      = 3
  unhealthy_threshold    = 3

  tags = local.tags
}

resource "aws_lb_target_group_attachment" "worker_nodes" {
  count            = length(var.kube_wn_private_ips)
  target_group_arn = module.alb_kubernetes.target_group_arn
  target_id        = module.ec2_worker_nodes[count.index].id
  port             = var.kube_node_port
}

resource "aws_route53_record" "alb_alias" {
  zone_id = data.aws_route53_zone.public.zone_id
  name    = "kube-lab.${var.public_zone_name}"
  type    = "A"

  alias {
    name                   = module.alb_kubernetes.alb_dns_name
    zone_id                = module.alb_kubernetes.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_lb_listener" "alb_https" {
  load_balancer_arn = module.alb_kubernetes.alb_arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = data.aws_acm_certificate.app_cert.arn
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"

  default_action {
    type             = "forward"
    target_group_arn = module.alb_kubernetes.target_group_arn
  }
}

resource "aws_lb_listener" "alb_http_redirect" {
  load_balancer_arn = module.alb_kubernetes.alb_arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}