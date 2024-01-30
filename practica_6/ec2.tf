
resource "aws_instance" "public_instance" {
  ami                     = "ami-0005e0cfe09cc9050"
  instance_type           = "t2.micro"
  subnet_id  = aws_subnet.public_subnet.id 
  key_name = data.aws_key_pair.key.key_name
   tags = {
    "Name" = "App-Desa"
  }

  vpc_security_group_ids = [ aws_security_group.sg_public_instance.id ]
  //lifecycle {
   // prevent_destroy = true
  //}
}

