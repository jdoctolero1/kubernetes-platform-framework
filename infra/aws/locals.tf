locals {
  kube_cp_name = "ec2-${var.environment}-kcp-${var.region_short}-01"
  security_group_control_plane_name        = "secgroup-${var.environment}-kcp-${var.region_short}"
  security_group_control_plane_description = "Security group for Kubernetes Control Plane"

  security_group_worker_node_name        = "secgroup-${var.environment}-kwn-${var.region_short}"
  security_group_worker_node_description = "Security group for Kubernetes Worker Nodes"

  security_group_app_lb_name = "secgroup-${var.environment}-klb-${var.region_short}"
  security_group_app_lb_description = "Security Group for Kubernetes Application Load Balancer"

  tags = merge({ environment = var.environment}, var.tags)
}