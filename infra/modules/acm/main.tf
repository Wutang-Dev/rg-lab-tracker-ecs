resource "aws_acm_certificate" "main" {
  domain_name       = var.domain_name
  validation_method = var.validation_method
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name      = var.domain_name
    ManagedBy = var.managed_by
    Project   = var.project
  }

}
