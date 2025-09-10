variable "vpc_id" {
  
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "internal" {
    description = "Internal or public facing ALB"
    default = false
}

variable "subnets" {
  description = "Subnets for the ALB"
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