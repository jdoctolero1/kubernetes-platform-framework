variable "name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "internal" {
  type        = bool
  description = "Whether the ALB is internal (true) or internet-facing (false)"
  default     = false
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the ALB"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to attach to the ALB (minimum two for multi-AZ)"
}

variable "enable_deletion_protection" {
  type        = bool
  description = "Whether to enable deletion protection on the ALB"
  default     = false
}

variable "idle_timeout" {
  type        = number
  description = "Idle timeout in seconds for ALB connections"
  default     = 60
}

variable "vpc_id" {
  type        = string
  description = "VPC ID in which to create the target group"
}

variable "target_group_name" {
  type        = string
  description = "Name of the ALB target group"
}

variable "target_type" {
  type        = string
  description = "Target type for the target group: instance, ip, or lambda"
  default     = "instance"
}

variable "target_port" {
  type        = number
  description = "Port on which the targets receive traffic"
  default     = 80
}

variable "target_protocol" {
  type        = string
  description = "Protocol used to route traffic to the targets (HTTP or HTTPS)"
  default     = "HTTP"
}

variable "health_check_path" {
  type        = string
  description = "Destination for health check requests"
  default     = "/"
}

variable "health_check_interval" {
  type        = number
  description = "Approximate amount of time between health checks in seconds"
  default     = 30
}

variable "health_check_timeout" {
  type        = number
  description = "Amount of time during which no response means a failed health check"
  default     = 5
}

variable "healthy_threshold" {
  type        = number
  description = "Number of consecutive successful health checks required before considering a target healthy"
  default     = 3
}

variable "unhealthy_threshold" {
  type        = number
  description = "Number of consecutive failed health checks required before considering a target unhealthy"
  default     = 3
}

variable "listener_port" {
  type        = number
  description = "Port on which the ALB listener accepts incoming traffic"
  default     = 80
}

variable "listener_protocol" {
  type        = string
  description = "Protocol for the ALB listener (HTTP or HTTPS)"
  default     = "HTTP"
}

variable "listener_ssl_policy" {
  type        = string
  description = "SSL policy for HTTPS listeners (see https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-https-listener.html#describe-ssl-policies)"
  default     = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

variable "listener_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate for HTTPS listeners"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all ALB resources"
  default     = {}
}
