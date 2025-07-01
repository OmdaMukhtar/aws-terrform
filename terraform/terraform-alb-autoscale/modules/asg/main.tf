 locals {
  name = "${var.project_name}-autoscaling"
}

module "asg" {
  source =  "terraform-aws-modules/autoscaling/aws"

  # Autoscaling group
  name            = "${var.project_name}-autoscaling"
  min_size                  = 0
  max_size                  = 1
  desired_capacity          = 1
  wait_for_capacity_timeout = "0"
  default_instance_warmup   = 300
  health_check_type         = "EC2"
  vpc_zone_identifier       = var.private_subnets

  # Launch Template
  launch_template_name        = "${var.project_name}-launch-template"
  launch_template_description = "${var.project_name} Complete launch template example"
  update_default_version      = true
  key_name = var.key_name 
  image_id          = data.aws_ami.this.id
  instance_type     = var.instance_type
  user_data = base64encode(file("${path.root}/scripts/user_data.sh"))

  security_groups = var.asg_security_group_id
}

data "aws_ami" "this" {
  owners =["amazon"]
  most_recent = true

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name ="name"
    values = ["al2023-ami-2023*"]
  }
}
 
