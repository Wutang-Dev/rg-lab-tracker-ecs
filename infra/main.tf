module "vpc" {
  source             = "./modules/vpc"
  cidr_block         = var.cidr_block
  project            = var.project
  managed_by         = var.managed_by
  nat_gateway_domain = var.nat_gateway_domain
  app_domain_name     = module.route53.app_record_fqdn
  alb_zone_id         = module.alb.alb_zone_id
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
  certificate_arn       = aws_acm_certificate_validation.main.certificate_arn
}
module "acm" {
  source                  = "./modules/acm"
  domain_name             = var.app_domain_name
  validation_record_fqdns = module.route53.acm_validation_record_fqdns
}
module "route53" {
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  app_domain_name           = var.app_domain_name
  domain_validation_options = module.acm.domain_validation_options
  alb_dns_name              = module.alb.alb_dns_name
  alb_zone_id               = module.alb.alb_zone_id
}
resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = module.acm.certificate_arn
  validation_record_fqdns = module.route53.acm_validation_record_fqdns
}