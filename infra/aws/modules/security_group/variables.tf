variable "name" {
  type        = string
  description = "Name tag for the security group"
}

variable "description" {
  type        = string
  description = "Description of the security group"
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID in which to create the security group"
}

variable "ingress_rules" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string), [])
    ipv6_cidr_blocks = optional(list(string), [])
    security_groups  = optional(list(string), [])
  }))
  description = "List of ingress rules to apply to the security group"
  default     = []
}

variable "egress_rules" {
  type = list(object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string), [])
    ipv6_cidr_blocks = optional(list(string), [])
    security_groups  = optional(list(string), [])
  }))
  description = "List of egress rules to apply to the security group"
  default = [
    {
      description      = "Allow all outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups  = []
    }
  ]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the security group"
  default     = {}
}
