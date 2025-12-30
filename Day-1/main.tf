resource "aws_instance" "ec2" {
    instance_type = var.type
    ami = var.ami_id
  
}