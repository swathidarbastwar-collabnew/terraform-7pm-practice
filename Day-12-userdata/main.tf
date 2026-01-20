provider "aws" {
  
}

resource "aws_instance" "name" {
    instance_type = "t3.micro"
    ami = "ami-068c0051b15cdb816"
    user_data = file("test.sh")
    tags = {
      Name = "new-ec2"
    }
  
}