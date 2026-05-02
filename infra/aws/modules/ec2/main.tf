resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.key_name
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = var.associate_public_ip_address
  user_data                   = var.user_data
  private_ip                  = var.private_ip
  
  # root_block_device {
  #   volume_size = var.root_volume_size
  #   volume_type = var.root_volume_type
  #   encrypted   = var.root_volume_encrypted
  # }

  tags = merge(var.tags, {
    Name = var.name
  })
}
