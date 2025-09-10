module "security_group" {
  source = "../security-group"

  type   = "app"
  vpc_id = var.vpc_id
  tags   = var.tags
}

module "security_group_rules" {
  source = "../security-group-rules/app"

  security_group_id = module.security_group.security_group_id
  alb_security_group_id = var.alb_security_group_id
  app_port = var.app_port
}

module "iam" {
  source = "../iam"

  type = "app"
}

module "launch_template" {
  source = "../launch-template"

  tags                      = var.tags
  type                      = var.type
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  vpc_security_group_ids    = [module.security_group.security_group_id]
  iam_instance_profile_name = module.iam.iam_instance_profile_name
  hibernation_mode          = var.hibernation_mode
  key_name                  = var.key_name
  user_data                 = var.user_data
}


resource "aws_autoscaling_group" "asg" {
  name = "${var.asg_name}-asg"

  # availability_zones = var.azs
  vpc_zone_identifier = [for subnet in var.subnets : subnet.id]
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size

  launch_template {
    id      = module.launch_template.launch_template_id
    version = "$Latest"
  }

  target_group_arns = var.target_group_arns

  tag {
    key                 = "Name"
    value               = "${var.asg_name}-asg"
    propagate_at_launch = true
  }

}