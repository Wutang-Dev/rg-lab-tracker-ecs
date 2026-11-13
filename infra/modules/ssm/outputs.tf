output "app_env_arn" {
  description = "ARN of the application environment parameter"
  value       = aws_ssm_parameter.app_env.arn
}
output "app_env_name" {
  description = "Name of the application environment parameter"
  value       = aws_ssm_parameter.app_env.name
}