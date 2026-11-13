resource "aws_ssm_parameter" "app_env" {
  name  = "/${var.project}/app_env"
  type  = "String"
  value = var.app_environment
  tags = {
    Name      = "/${var.project}/app_env"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}