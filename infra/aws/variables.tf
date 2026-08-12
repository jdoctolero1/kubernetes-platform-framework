variable "region" {
  type        = string
  description = "AWS region to deploy resources into"
}

variable "region_short" {
  type        = string
  description = "Shortened version of the AWS region IE: us-east1 = ue1"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g. dev, staging, prod)"
}

variable "vpc_name" {
  description = "VPC Name for the Kubernetes Cluster"
  type        = string
}

variable "subnet_admin_name" {
  description = "Admin Subnet"
  type        = string
}

variable "subnet_app_name" {
  description = "App Subnet"
  type        = string
}

variable "kube_cp_private_ip" {
  description = "Private IP address to assign to the Kubernetes Control Plane ec2 instance"
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}

# ── EC2 instance ─────────────────────────────────────────────────────────────

variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair to use for SSH access"
}

variable "kube_admin_username" {
  type        = string
  description = "Username to create via cloud-init on the Kubernetes control plane instance"
  default     = "labadm"
}

variable "kube_authorized_keys" {
  type        = list(string)
  description = "SSH public keys to add to the labadm user's authorized_keys"
  default     = []
}

variable "private_zone_name" {
  type        = string
  description = "Domain suffix used when rendering cloud-init hostnames"
  default     = "localdomain"
}

variable "vm_associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP with the EC2 instance"
  default     = false
}
