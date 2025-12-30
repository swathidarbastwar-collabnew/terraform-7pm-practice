output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "Private_ip" {
  value = aws_instance.ec2.private_ip
}