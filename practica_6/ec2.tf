
resource "aws_instance" "public_instance" {
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet
  key_name      = data.aws_key_pair.key.key_name
  tags = {
    "Name" = "App-Desa"
  }
  lifecycle {
    create_before_destroy = true
  }
}

