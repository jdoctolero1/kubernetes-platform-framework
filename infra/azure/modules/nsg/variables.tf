variable "nsg_name" {
  type        = string
  description = "Name of the NSG"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the NSG"
}

variable "rules" {
  description = "Map of security rules"
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefixes    = list(string) 
    destination_address_prefix = string
  }))
  default = {}
}

variable "network_interface_ids" {
  description = "NICs associated to the NSG"
  type = map(string)
}