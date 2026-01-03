
resource "aws_s3_bucket" "s3bucket1" {
    bucket = "sghdomudbsldhdse"
  
}

resource "aws_instance" "ec2" {
    instance_type = "t3.micro"
    ami = "ami-068c0051b15cdb816"
    tags = {
      name = "dev1"  
    }
}