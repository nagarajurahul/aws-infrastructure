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

  default = { "Environment" = "production" }
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

variable "alb_enable_deletion_protection" {
  description = "Enable deletion protection for ALB"
  default     = true
}

variable "target_port" {
  description = "Target port for the ALB Target Group"
  type        = number

  default = 8080
}

variable "type" {
  description = "Type of the application"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID to use for launching EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to use (e.g., t3.micro, m5.large)"
  type        = string
}

variable "hibernation_mode" {
  description = "Whether to enable hibernation support for the instances (only supported on certain instance families/AMIs)"
  type        = bool

  default = false
}

variable "key_name" {
  description = "Name of the SSH key pair to associate with the instances"
  type        = string

  default = null
}

variable "user_data" {
  description = "User data script to run at boot time (plain text, will be base64 encoded automatically)"
  type        = string

  default = ""
}

variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}

variable "desired_capacity" {
  description = "The number of instances that should be running in the ASG"
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances in the ASG"
  type        = number
}

variable "min_size" {
  description = "The minimum number of instances in the ASG"
  type        = number
}