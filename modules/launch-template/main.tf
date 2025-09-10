data "aws_ami" "ubuntu"{
    owners = ["amazon"]

    most_recent = true
    
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

}

resource "aws_launch_template" "launch_template"{
    name = "${var.type}-launch-template"
    description = "Launch template for ${var.type}"

    image_id = var.ami_id

    instance_type = var.instance_type

    vpc_security_group_ids = var.vpc_security_group_ids

    iam_instance_profile {
        name = var.iam_instance_profile_name
    }

    tag_specifications {
        resource_type = "instance"

        tags = merge(
            var.tags, 
            {
                Type = var.type
                Name = "${var.type}-instance"
            }
        )
    }

        tags = merge(
            var.tags, 
            {
                Type = var.type
                Name = "${var.type}-launch-template"
            }
        )

    # For hibernation
    hibernation_options {
        configured = var.hibernation_mode
    }
}