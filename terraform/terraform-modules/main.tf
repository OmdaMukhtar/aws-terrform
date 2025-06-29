module "vpc" {
  source     = "./modules/vpc"
}

module "compute" {
  source   = "./modules/compute"
  security_group_ids = module.security_groups.security_group_id
  subnet = element(module.vpc.public_subnets, 0)
}

module "security_groups" {
  source   = "./modules/security-groups"
  vpc_id   = module.vpc.vpc_id
}
