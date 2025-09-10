variable "security_group_id" {
    description = "Security group to attach to the security-group-rules"
    type = string
}

variable "alb_ingress_cidr" {
  description = "CIDR block allowed to access the ALB"
  type        = string
}