variable "zone_id" {
  description = "Zone ID of the Route 53 private hosted zone"
  type        = string
}

variable "record_name" {
  description = "Relative record name to create within the hosted zone"
  type        = string
}

variable "private_ip" {
  description = "Private IP address to assign to the A record"
  type        = string
}