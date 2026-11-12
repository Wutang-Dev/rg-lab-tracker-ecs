output "hosted_zone_id" {
  description = "The ID of the existing Route 53 hosted zone"
  value       = data.aws_route53_zone.main.zone_id
}
output "hosted_zone_name" {
  description = "The name of the existing Route 53 hosted zone"
  value       = data.aws_route53_zone.main.name
}
output "acm_validation_record_fqdns" {
  description = "FQDNs of the ACM DNS validation records"
  value       = [for record in aws_route53_record.acm_validation : record.fqdn]
}
output "app_record_fqdn" {
  description = "Fully qualified domain name of the application A record"
  value       = aws_route53_record.a.fqdn
}
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = var.alb_dns_name
}
output "alb_zone_id" {
  description = "Canonical hosted zone ID of the ALB"
  value       = var.alb_zone_id
}