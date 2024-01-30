
resource "aws_instance" "public_instance" {
  ami                    = "ami-0005e0cfe09cc9050"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = <<EOF
#!/bin/bash
echo "esto es un mensaje" > ~/mensaje.txt
EOF
  tags = {
    "Name" = "App-Desa"
  }
  //lifecycle {
  // prevent_destroy = true
  //}
  provisioner "local-exec" {
    command = "echo instancia creada con IP ${aws_instance.public_instance.public_ip} >> datos_instancia.txt"
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo instancia destruida con IP ${self.public_ip} >> datos_instancia.txt"
  }
  /*   provisioner "remote-exec" {
    inline = [
      "echo 'Hola Mundo' > ~/saludo.txt"
    ]
    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("test-k.pem")
    }
  } */

}

