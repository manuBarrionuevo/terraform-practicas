
resource "aws_instance" "public_instance" {
  ami                     = "ami-0005e0cfe09cc9050"
  instance_type           = "t2.micro"
  subnet_id  = aws_subnet.public_subnet.id 
   tags = {
    "Name" = "App-Desa"
  }
}

