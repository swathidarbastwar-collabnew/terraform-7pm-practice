resource "aws_instance" "name" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t3.micro"
    tags = {
      Name = "ec2"
    }
  
}

resource "aws_s3_bucket" "name" {
    bucket = "qwertyuiopjlkmn"
  
}

resource "aws_s3_bucket_versioning" "versioningnew" {
  bucket = aws_s3_bucket.name.id
  versioning_configuration {
    status = "Enabled"
  }
}