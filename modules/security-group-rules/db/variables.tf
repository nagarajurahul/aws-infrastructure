variable "security_group_id" {
    description = "Security group to attach to the security-group-rules"
    type = string
}

variable "app_security_group_id" {
  description = "App SG ID allowed to access db"
  type        = string
}
