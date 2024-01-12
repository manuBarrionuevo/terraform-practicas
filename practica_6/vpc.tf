resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.nv_cidr
  instance_tenancy = "default"

  tags = {
    owner       = "Manuel"
    Environment = "Dev"
    Name        = "Desa-VPC-NV"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  cidr_block = var.private_subnet
}