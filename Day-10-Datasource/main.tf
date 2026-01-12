data "aws_subnet" "name" {
      filter {
        name = "tag:Name"
        values = ["test"]
      }
}


data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
             filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
        filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}





resource "aws_instance" "name" {
     instance_type = "t3.micro"
     ami = data.aws_ami.amzlinux.id
     subnet_id = data.aws_subnet.name.id
     tags = {
         Name = "newec2"
     }
}