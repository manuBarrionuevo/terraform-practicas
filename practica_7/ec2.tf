resource "aws_instance" "public_instance" {
  ami = "ami-0277155c3f0ab2930"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.key.key_name
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    "Name" = "test-import-terraform"
  }
  vpc_security_group_ids = [
    aws_security_group.sg_public_instance.id
  ]
}
