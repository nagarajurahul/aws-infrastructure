variable "security_group_id" {
    description = "Security group to attach to the security-group-rules"
    type = string
}

variable "alb_security_group_id" {
  description = "ALB SG ID allowed to access app"
  type        = string
}

variable "app_port" {
    description = "Default Port where app is deployed"
    type = number
    default = 8080
}