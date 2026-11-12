module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_block
  project            = var.project
  managed_by         = var.managed_by
  nat_gateway_domain = var.nat_gateway_domain
}