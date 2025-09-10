output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnets"
  value       = module.vpc.private_subnets

  sensitive = true
}

output "public_subnets" {
  description = "Public subnets"
  value       = module.vpc.public_subnets

  sensitive = true
}

output "db_subnets" {
  description = "DB subnets"
  value       = module.vpc.db_subnets

  sensitive = true
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "app_blue_target_group_arn" {
  description = "ARN of the Target Group"
  value       = module.alb.app_blue_target_group_arn
}

output "app_green_target_group_arn" {
  description = "ARN of the Target Group"
  value       = module.alb.app_green_target_group_arn
}

output "alb_security_group_id" {
  description = "Security Group of the ALB"
  value       =  module.alb.alb_security_group_id
}

output "asg_security_group_id" {
  description = "Security Group of the ASG"
  value       = module.asg.asg_security_group_id
}

output "iam_instance_profile_name" {
  description = "IAM instance profile name attached to EC2/ASG"
  value       = module.asg.iam_instance_profile_name
}

output "iam_role_name" {
  description = "IAM role name for EC2 instances"
  value       = module.asg.iam_role_name
}

output "launch_template_id" {
  description = "ID of the Launch Template used by ASG"
  value       = module.asg.launch_template_id
}

output "launch_template_version" {
  description = "Version of the Launch Template"
  value       = module.asg.launch_template_version
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = module.asg.asg_name
}

output "asg_id" {
  description = "ID of the Auto Scaling Group"
  value       = module.asg.asg_id
}

output "asg_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = module.asg.asg_arn
}

output "asg_target_group_arns" {
  description = "Target Group ARNs the ASG is registered with"
  value       = module.asg.asg_target_group_arns
}
