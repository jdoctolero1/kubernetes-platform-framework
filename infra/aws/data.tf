data "aws_vpc" "main" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "admin_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_admin_name]
  }
}

data "aws_subnet" "app_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_app_name]
  }
}

data "aws_subnet" "web_subnet_01" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_web_name_01]
  }
}

data "aws_subnet" "web_subnet_02" {
  filter {
    name   = "tag:Name"
    values = [var.subnet_web_name_02]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_route53_zone" "private" {
  name         = var.private_zone_name
  private_zone = true
}

data "aws_route53_zone" "public" {
  name         = var.public_zone_name
  private_zone = false
}

data "aws_acm_certificate" "app_cert" {
  domain   = var.certificate_domain_name
  statuses = ["ISSUED"]
}