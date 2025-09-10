variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "alb_name" {
  description = "Name prefix for ALB"
  type        = string
}

variable "internal" {
    description = "Internal or public facing ALB"
    default = false
}

variable "subnets" {
  description = "List of Subnets for the ALB"
  type        = list(string)    
}

variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to access the ALB"
  type        = list(string)
}

variable "s3_bucket_id" {
    description = "S3 Bucket ID"
    type = string
}