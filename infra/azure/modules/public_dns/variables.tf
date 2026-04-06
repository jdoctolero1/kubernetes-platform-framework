variable "dns_zone_name" {
  description = "The name of the DNS zone (e.g. example.com)"
  type        = string
}

variable "dns_zone_resource_group_name" {
  description = "The resource group where the DNS zone lives"
  type        = string
}

variable "record_name" {
  description = "The name of the A record (use @ for the zone apex)"
  type        = string
}

variable "ttl" {
  description = "Time-to-live in seconds"
  type        = number
  default     = 300
}

variable "ip_addresses" {
  description = "List of IPv4 addresses for the A record"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the A record"
  type        = map(string)
  default     = {}
}
