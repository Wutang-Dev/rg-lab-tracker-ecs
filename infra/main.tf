module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_block
  project            = var.project
  managed_by         = var.managed_by
  nat_gateway_domain = var.nat_gateway_domain
}
module "security_groups" {
  source     = "./modules/security-groups"
  project    = var.project
  vpc_id     = module.vpc.vpc_id
  managed_by = var.managed_by
}
module "alb" {
  source                = "./modules/alb"
  project               = var.project
  managed_by            = var.managed_by
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id
}
