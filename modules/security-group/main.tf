# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-rules-reference.html

resource "aws_security_group" "this" {
  name        = "${var.type}-security-group"
  description = "Security group for ${var.type}"

  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      Name = "${var.type}-security-group"
      Type = var.type
    }
  )
}