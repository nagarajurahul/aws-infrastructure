output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.iam_instance_profile.name
}

output "iam_role_name" {
  description = "IAM role name for EC2 instances"
  value       = aws_iam_role.role.name
}