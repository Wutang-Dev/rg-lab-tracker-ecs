# aws vpc module
resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name      = "${var.project}-vpc"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}

resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + 1)
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name      = "${var.project}-public-subnet-${count.index + 1}"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + 11)
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name      = "${var.project}-private-subnet-${count.index + 1}"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name      = "${var.project}-igw"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name      = "${var.project}-public-rt"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  tags = {
    Name      = "${var.project}-private-rt"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
resource "aws_eip" "nat" {
  domain = var.nat_gateway_domain
  tags = {
    Name      = "${var.project}-nat-eip"
    Project   = var.project
    ManagedBy = var.managed_by
  }
}
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name      = "${var.project}-nat-gateway"
    Project   = var.project
    ManagedBy = var.managed_by
  }
  depends_on = [aws_internet_gateway.main]
}