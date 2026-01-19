variable "create_instance" {
  type    = bool
  default = false
}

resource "aws_instance" "ec2" {
  count = var.create_instance ? 1 : 0

  ami           = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"
}
