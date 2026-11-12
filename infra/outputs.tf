output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnet_ids
}
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = module.vpc.public_route_table_id
}
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = module.vpc.private_route_table_id
}
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = module.vpc.nat_gateway_id
}
output "nat_gateway_eip" {
  description = "The Elastic IP of the NAT Gateway"
  value       = module.vpc.nat_gateway_eip
}
output "nat_gateway_public_ip" {
  description = "The public IP of the NAT Gateway"
  value       = module.vpc.nat_gateway_public_ip
}
output "alb_security_group_id" {
  description = "The ID of the ALB security group"
  value       = module.security_groups.alb_security_group_id
}
output "ecs_security_group_id" {
  description = "The ID of the ECS security group"
  value       = module.security_groups.ecs_security_group_id
}
output "application_url" {
  description = "HTTPS URL for the RG Lab Tracker application"
  value       = "https://${module.route53.app_record_fqdn}"
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "certificate_domain_name" {
  description = "Domain name associated with the ACM certificate"
  value       = module.acm.certificate_domain_name
}
output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs.ecs_cluster_name
}
output "ecs_task_execution_role_name" {
  description = "Name of the ECS task execution role"
  value       = module.iam.ecs_task_execution_role_name
}

output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS task execution role"
  value       = module.iam.ecs_task_execution_role_arn
}
output "ecs_task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = module.ecs.task_definition_arn
}
output "ecs_task_definition_family" {
  description = "Family name of the ECS task definition"
  value       = module.ecs.task_definition_family
}
output "ecs_service_name" {
  description = "Name of the ECS Fargate service"
  value       = module.ecs.ecs_service_name
}