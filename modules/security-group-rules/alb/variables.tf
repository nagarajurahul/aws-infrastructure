variable "alb_ingress_cidrs" {
  description = "CIDR blocks allowed to access the ALB"
  type        = list(string)
}