module "vm" {
  source = "./modules/ec2_instance"

  name                        = var.vm_name
  ami                         = var.vm_ami
  instance_type               = var.vm_instance_type
  subnet_id                   = var.vm_subnet_id
  security_group_ids          = var.vm_security_group_ids
  key_name                    = var.vm_key_name
  iam_instance_profile        = var.vm_iam_instance_profile
  associate_public_ip_address = var.vm_associate_public_ip_address
  root_volume_size            = var.vm_root_volume_size
  root_volume_type            = var.vm_root_volume_type
  root_volume_encrypted       = var.vm_root_volume_encrypted
  user_data                   = var.vm_user_data

  tags = var.tags
}
