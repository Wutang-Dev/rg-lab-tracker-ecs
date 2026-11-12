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