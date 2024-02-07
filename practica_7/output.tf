output "ec2_public_ip" {
  description = "IPs públicas de las instancias"
  value       = { for key, instance in aws_instance.public_instance : key => instance.public_ip }
} 
