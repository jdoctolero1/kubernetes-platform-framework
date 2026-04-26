variable "name" {
  type        = string
  description = "Name tag for the Elastic IP"
}

variable "instance_id" {
  type        = string
  description = "EC2 instance ID to associate the Elastic IP with"
  default     = null
}

variable "network_interface_id" {
  type        = string
  description = "Network interface ID to associate the Elastic IP with (used instead of instance_id when specified)"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the Elastic IP"
  default     = {}
}
