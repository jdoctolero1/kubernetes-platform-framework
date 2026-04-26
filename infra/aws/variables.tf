variable "region" {
  type        = string
  description = "AWS region to deploy resources into"
}

variable "environment" {
  type        = string
  description = "Deployment environment (e.g. dev, staging, prod)"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}

# ── EC2 instance ─────────────────────────────────────────────────────────────

variable "vm_name" {
  type        = string
  description = "Name tag for the EC2 instance"
}

variable "vm_ami" {
  type        = string
  description = "AMI ID to use for the EC2 instance"
}

variable "vm_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "vm_subnet_id" {
  type        = string
  description = "Subnet ID in which to launch the EC2 instance"
}

variable "vm_security_group_ids" {
  type        = list(string)
  description = "Security group IDs to associate with the EC2 instance"
  default     = []
}

variable "vm_key_name" {
  type        = string
  description = "EC2 key pair name for SSH access"
  default     = null
}

variable "vm_iam_instance_profile" {
  type        = string
  description = "IAM instance profile to attach to the EC2 instance"
  default     = null
}

variable "vm_associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP with the EC2 instance"
  default     = false
}

variable "vm_root_volume_size" {
  type        = number
  description = "Root EBS volume size in GiB"
  default     = 20
}

variable "vm_root_volume_type" {
  type        = string
  description = "Root EBS volume type (e.g. gp3)"
  default     = "gp3"
}

variable "vm_root_volume_encrypted" {
  type        = bool
  description = "Whether to encrypt the root EBS volume"
  default     = true
}

variable "vm_user_data" {
  type        = string
  description = "User data script to run on EC2 instance launch"
  default     = null
}
