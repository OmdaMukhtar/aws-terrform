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
  user_data   = filebase64("${path.root}/scripts/user_data.sh")

 
  security_groups = [module.web_server_sg.security_group_id]
  # target_group_arns = var.alb_target_groups_web_server_target_group_arn
}

# module "web_server_sg" {
#   source = "terraform-aws-modules/security-group/aws//modules/http-80"
  
#   name = "web-server"
#   description = "Security group for web-server withHTTP ports open within VPC"
#   vpc_id = var.vpc_id

#   ingress_cidr_blocks = [var.vpc_cidr_block] # array []
# }

module "web_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"

  name        = "web-server-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "HTTP access"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
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
 
