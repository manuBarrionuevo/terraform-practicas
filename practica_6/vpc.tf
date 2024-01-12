resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.nv_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "VPC-DESA"
  }  
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnet[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public-subnet"
  }  
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnet[1]
    tags = {
    "Name" = "Private-subnet"
  }  
}

