resource "aws_vpc" "vpc_virginia" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    owner       = "Manuel"
    Environment = "Dev"
    Name        = "Desa-VPC-NV"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block       = "10.0.15.0/24"
  instance_tenancy = "default"

  tags = {
    owner       = "Manuel"
    Environment = "Dev"
    Name        = "Desa-VPC-O"
  }
  provider = aws.ohio
}
