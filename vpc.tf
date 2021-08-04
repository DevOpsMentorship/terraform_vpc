# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "vpc"
  }
}
# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "gateway"
  }
}
# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public_subnet"
  }
}
# Create Route Table for public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags       = {
    Name     = "route_table_for_public"
  }
}
# Associate Public Subnet to "Public Route Table"
resource "aws_route_table_association" "public_subnet_route_table_association" {
  subnet_id           = aws_subnet.public_subnet.id
  route_table_id      = aws_route_table.public_route_table.id
}
# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.private_subnet_cidr
  availability_zone        = "eu-west-2a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private_subnet"
  }
}
# Create Route Table for private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.gateway.id
  }

  tags       = {
    Name     = "route_table_for_private"
  }
}

# Associate Private Subnet to "Private Route Table"
resource "aws_route_table_association" "private_subnet_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}