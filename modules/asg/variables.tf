variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "type" {
  description = "Type or role of the application (e.g., frontend, backend, worker)"
  type        = string
}

variable "alb_security_group_id" {
  description = "ALB SG ID allowed to access app"
  type        = string
}

variable "app_port" {
  description = "App port for the ASG"
  type        = number

  default = 8080
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

variable "user_data_file" {
  type        = string
}

variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}

variable "subnets" {
  description = "List of Subnets for the ASG"
  type        = list(string)
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

variable "target_group_arns" {
  description = "List of ALB/NLB target group ARNs to associate with the ASG"
  type        = list(string)
}
