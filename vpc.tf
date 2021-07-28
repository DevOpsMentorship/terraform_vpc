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
