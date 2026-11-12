output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}
output "vpc_enable_dns_support" {
  description = "Whether DNS support is enabled in the VPC"
  value       = aws_vpc.main.enable_dns_support
}
output "vpc_enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled in the VPC"
  value       = aws_vpc.main.enable_dns_hostnames
}
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.private : subnet.id]
}
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.main.id
}
output "nat_gateway_eip" {
  description = "The Elastic IP of the NAT Gateway"
  value       = aws_eip.nat.id
}
output "nat_gateway_public_ip" {
  description = "The public IP of the NAT Gateway"
  value       = aws_eip.nat.public_ip
}