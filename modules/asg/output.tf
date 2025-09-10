output "asg_security_group_id" {
  description = "Security Group of the ASG"
  value       = module.security_group.security_group_id
}

output "iam_instance_profile_name" {
  description = "IAM instance profile name attached to EC2/ASG"
  value       = module.iam.iam_instance_profile_name
}

output "iam_role_name" {
  description = "IAM role name for EC2 instances"
  value       = module.iam.iam_role_name
}

output "launch_template_id" {
  description = "ID of the Launch Template used by ASG"
  value       = module.launch_template.launch_template_id
}

output "launch_template_name" {
  description = "Name of the Launch Template"
  value       = module.launch_template.launch_template_name
}

output "launch_template_version" {
  description = "Version of the Launch Template"
  value       = "$Latest"
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.name
}

output "asg_id" {
  description = "ID of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.id
}

output "asg_arn" {
  description = "ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.arn
}

output "asg_target_group_arns" {
  description = "Target Group ARNs the ASG is registered with"
  value       = aws_autoscaling_group.asg.target_group_arns
}
