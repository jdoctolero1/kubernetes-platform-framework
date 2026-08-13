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

module "security_group_worker_nodes" {
  source = "./modules/security_group"

  name        = local.security_group_worker_node_name
  description = local.security_group_worker_node_description
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
    Name = local.security_group_worker_node_name
  })
}