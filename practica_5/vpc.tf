resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.nv_cidr
  instance_tenancy = "default"

  tags = {
    owner       = "Manuel"
    Environment = "Dev"
    Name        = "Desa-VPC-NV"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block       = var.o_cidr
  instance_tenancy = "default"

  tags = {
    owner       = "Manuel"
    Environment = "Dev"
    Name        = "Desa-VPC-O"
  }
  provider = aws.ohio
}

