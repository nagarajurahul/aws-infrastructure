variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "alb_ingress_cidr" {
  description = "CIDR range allowed to access the ALB"
  type        = string
}

variable "alb_name" {
  description = "Name prefix for ALB"
  type        = string
}

variable "internal" {
  description = "Internal or Public facing ALB"
  default     = true
}

variable "alb_enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  default     = true
}

variable "subnets" {
  description = "List of Subnets for the ALB"
  type        = list(string)
}

variable "s3_bucket_id" {
  description = "S3 Bucket ID"
  type        = string
}

variable "target_port" {
  description = "Target port for the ALB Target Group"
  type        = number

  default = 8080
}

variable "unhealthy_draining_interval" {
  description = "unhealthy_draining_interval"
  type        = number

  default = 60
}