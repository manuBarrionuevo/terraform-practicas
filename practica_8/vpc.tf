resource "aws_vpc" "vpc_virginia" {
  cidr_block       = var.nv_cidr
  instance_tenancy = "default"
  tags = {
    "Name" = "VPC-DESA-${local.sufix}" 
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnet[0]
  map_public_ip_on_launch = true
  tags = {
    "Name" = "Public-subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnet[1]
  tags = {
    "Name" = "Private-subnet--${local.sufix}"
  }
  /* depends_on = [
    aws_instance.public_instance
  ] */
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags = {
    Name = "igw vpc VN-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
tags = {
    Name = "public crt-${local.sufix}"
  }
}
resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}
resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH indbound traffic and ALL egress traffic"
  vpc_id = aws_vpc.vpc_virginia.id

  dynamic "ingress" {
    for_each = var.ingres_port_list
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}

module "my_bucket" {
  source = "./modulos/s3"
  bucket_name = "nombreunico344564"
}

output "s3_arn" {
  value = module.my_bucket.s3_bucket_arn
}
