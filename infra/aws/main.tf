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

  tags = local.tags
}

module "route53_a_record" {
  source = "./modules/route53_a_record"

  zone_id      = data.aws_route53_zone.private.zone_id
  record_name  = local.kube_cp_name
  private_ip   = module.ec2_control_plane.private_ip
}