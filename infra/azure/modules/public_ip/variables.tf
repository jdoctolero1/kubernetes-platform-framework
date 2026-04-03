variable "resource_group_name" {
  description = "The name of the resource group in which to create the Public IP."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Public IP resource."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The Azure location where the Public IP will be created."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the Public IP resource."
  type        = string
}

variable "allocation_method" {
  description = "Defines the allocation method for the Public IP. Possible values are Static or Dynamic."
  type        = string
  default     = "Static"
}
