variable "project_name" {
  type = string
  default = "demo-project"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "key_name" {
  type = string
  default = "kali"
}

variable "vpc_cidr_block" {
  type = string
}

# For now will use one imported insidde
# variable "security_gropu_id" {
#   type = list(string)
# }

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

# variable "alb_target_groups_web_server_target_group_arn" {
#   type = list(string)
# }
