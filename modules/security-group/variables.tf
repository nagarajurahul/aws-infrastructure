variable "vpc_id" {
  description = "VPC ID where the Security Group will be created"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "type" {
  description = "Type of the security group"
  type = string
}