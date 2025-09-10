variable "region" {
  type        = string
  description = "The AWS Region where VPC will be deployed"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]{1}$", var.region))
    error_message = "Please enter a valid AWS region (e.g., us-east-1, us-west-2, eu-central-1)"
  }
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)

  default = { "Environment" = "Production" }
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool

  default = true
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones to use"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of Public Subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of Private Subnet CIDRs"
}

variable "db_subnets" {
  type        = list(string)
  description = "List of DB Subnet CIDRs"
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