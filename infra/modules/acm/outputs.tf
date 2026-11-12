output "certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.main.arn
}
output "certificate_id" {
  description = "The ID of the ACM certificate"
  value       = aws_acm_certificate.main.id
}
output "certificate_domain_name" {
  description = "The domain name associated with the ACM certificate"
  value       = aws_acm_certificate.main.domain_name
}
output "domain_validation_options" {
  description = "DNS validation records required for the ACM certificate"
  value       = aws_acm_certificate.main.domain_validation_options
}