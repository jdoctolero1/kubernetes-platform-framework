variable "name" {
  type        = string
  description = "Name tag for the EC2 instance"
}

variable "ami" {
  type        = string
  description = "AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type (e.g. t3.medium)"
  default     = "t3.medium"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID in which to launch the instance"
}

variable "private_ip" {
  description = "Private IP address to assign to the VM"
  type        = string
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
  default     = []
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair to use for SSH access"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name to attach to the instance"
  default     = null
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether to associate a public IP address with the instance"
  default     = false
}

variable "root_volume_size" {
  type        = number
  description = "Size of the root EBS volume in GiB"
  default     = 20
}

variable "root_volume_type" {
  type        = string
  description = "Type of the root EBS volume (e.g. gp3, gp2)"
  default     = "gp3"
}

variable "root_volume_encrypted" {
  type        = bool
  description = "Whether to encrypt the root EBS volume"
  default     = true
}

variable "user_data" {
  type        = string
  description = "User data script to run on instance launch"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the EC2 instance"
  default     = {}
}
