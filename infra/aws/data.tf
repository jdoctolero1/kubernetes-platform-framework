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