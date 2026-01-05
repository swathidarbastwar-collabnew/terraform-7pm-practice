resource "aws_instance" "ec2" {
    instance_type = "t3.micro"
    ami = "ami-068c0051b15cdb816"
    tags = {
      Name = "Prod"  
    }
}