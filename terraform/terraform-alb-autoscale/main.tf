# Import VPC
#------------------------
module "vpc" {
  source     = "./modules/vpc"
}


# Import Auto Scaling Groups
#------------------------
module "autoscaling" {
  source   = "./modules/asg"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
  private_subnets = module.vpc.private_subnets
  key_name = "kali"
}

# Import Applicatoin Loadbalancer
#------------------------
module "alb" {
  source   = "./modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_cidr_block = module.vpc.vpc_cidr_block
  vpc_id = module.vpc.vpc_id
}

# Import Security Groups
#------------------------
# module "security_groups" {
#   source   = "./modules/security-groups"
#   vpc_id   = module.vpc.vpc_id
# }

