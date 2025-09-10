variable "type" { 
    description = "Type of the application"
    type = string
}

variable "managed_policy_arns" {
  description = "List of managed IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}