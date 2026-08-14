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
    },
    {
      description = "Allow Kubernetes API Server"
      from_port   = 6443
      to_port     = 6443
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow etcd"
      from_port   = 2379
      to_port     = 2380
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block]
    },
    {
      description = "Allow Kubelet API"
      from_port   = 10250
      to_port     = 10250
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow kube-scheduler"
      from_port   = 10251
      to_port     = 10251
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block]
    },
    {
      description = "Allow kube-controller-manager"
      from_port   = 10252
      to_port     = 10252
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block]
    },
    {
      description = "Allow Calico BGP"
      from_port   = 179
      to_port     = 179
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Calico Typha"
      from_port   = 5473
      to_port     = 5473
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Cilium VXLAN"
      from_port   = 8472
      to_port     = 8472
      protocol    = "udp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Cilium Metrics"
      from_port   = 4240
      to_port     = 4240
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
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
    },
    {
      description = "Allow Kubelet API"
      from_port   = 10250
      to_port     = 10250
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Read-only Kubelet API"
      from_port   = 10255
      to_port     = 10255
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow NodePort Services"
      from_port   = 30000
      to_port     = 32767
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Calico BGP"
      from_port   = 179
      to_port     = 179
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Calico Typha"
      from_port   = 5473
      to_port     = 5473
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Cilium VXLAN"
      from_port   = 8472
      to_port     = 8472
      protocol    = "udp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    },
    {
      description = "Allow Cilium Metrics"
      from_port   = 4240
      to_port     = 4240
      protocol    = "tcp"
      cidr_blocks = [data.aws_subnet.admin_subnet.cidr_block, data.aws_subnet.app_subnet.cidr_block]
    }
  ]

  egress_rules = [
    {
      description = "Allow all outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = merge(local.tags, {
    Name = local.security_group_worker_node_name
  })
}