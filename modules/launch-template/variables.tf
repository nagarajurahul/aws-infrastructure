

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "type" {
  description = "Type or role of the application (e.g., frontend, backend, worker)"
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

variable "vpc_security_group_ids" {
  description = "List of security group IDs to associate with the instances"
  type        = list(string)
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to associate with the instances"
  type        = string

  default     = null
}

variable "hibernation_mode" {
  description = "Whether to enable hibernation support for the instances (only supported on certain instance families/AMIs)"
  type        = bool

  default     = false
}

variable "key_name" {
  description = "Name of the SSH key pair to associate with the instances"
  type        = string

  default     = null
}

variable "user_data" {
  description = "User data script to run at boot time (plain text, will be base64 encoded automatically)"
  type        = string
  
  default     = ""
}