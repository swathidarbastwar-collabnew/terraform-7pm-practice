provider "aws" {
  
}

resource "aws_instance" "name" {
    instance_type = "t3.micro"
    ami = "ami-068c0051b15cdb816"
    tags = {
      Name = "new-ec2"
    }
  
}