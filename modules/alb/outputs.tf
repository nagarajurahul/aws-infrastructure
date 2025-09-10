output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "app_blue_target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.app_blue.arn
}

output "app_green_target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.app_green.arn
}