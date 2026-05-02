module "security_group_control_plane" {
  source = "./modules/security_group"

  name        = local.security_group_control_plane_name
  description = local.security_group_control_plane_description
  vpc_id      = data.aws_vpc.main.id

  ingress_rules = [
    {
      description = "Allow ICMP from Admin Subnet"
      from_port   = -1
      to_port     = -1
      protocol    = "icmp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block]
    },
    {
      description = "Allow SSH from Admin Subnet"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block]
    }
  ]

  tags = merge(local.tags, {
    Name = local.security_group_control_plane_name
  })
}

module "ec2_control_plane" {
  source = "./modules/ec2"

  name                        = local.kube_cp_name
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = data.aws_subnet.admin_subnet.id
  private_ip                  = var.kube_cp_private_ip
  security_group_ids          = [module.security_group_control_plane.id]
  key_name                    = var.key_name
  # iam_instance_profile        = var.vm_iam_instance_profile
  associate_public_ip_address = var.vm_associate_public_ip_address
  # root_volume_size            = var.vm_root_volume_size
  # root_volume_type            = var.vm_root_volume_type
  # root_volume_encrypted       = var.vm_root_volume_encrypted
  # user_data                   = var.vm_user_data

  tags = local.tags
}