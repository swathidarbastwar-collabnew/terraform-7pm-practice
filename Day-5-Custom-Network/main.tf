resource "aws_vpc" "name" {
    tags = {
        Name = "VPC1"
    }
    cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "pub-subnet"
    }
}

resource "aws_subnet" "pvt" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "pvt-subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "IGWpub"
    }
}

#resource "aws_internet_gateway_attachment" "name" {
 #   vpc_id = aws_vpc.name.id
  #  internet_gateway_id = aws_internet_gateway.gw.id

#}

resource "aws_route_table" "pubRT" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "pub-RT"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
  
}

resource "aws_route_table_association" "pubname" {
    subnet_id = aws_subnet.pub.id
    route_table_id = aws_route_table.pubRT.id
  
}

resource "aws_nat_gateway" "natgw" {  
  connectivity_type = "private"
  subnet_id         = aws_subnet.pub.id
  tags = {
      Name = "NATgwpvt"
    }
}

resource "aws_route_table" "pvtRT" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "pvt-RT"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.natgw.id
    }
  
}

resource "aws_route_table_association" "pvtname" {
    subnet_id = aws_subnet.pvt.id
    route_table_id = aws_route_table.pvtRT.id
  
}

resource "aws_security_group" "SG" {
  name   = "allow_tls"
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "NEWSG"
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "public-server" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t3.micro"
    tags = {
      Name = "Bastion-server"
    }
    subnet_id = aws_subnet.pub.id
    vpc_security_group_ids = [ aws_security_group.SG.id ]

}

resource "aws_instance" "private-server" {
    ami = "ami-068c0051b15cdb816"
    instance_type = "t3.micro"
    tags = {
      Name = "private-server"
    }
    subnet_id = aws_subnet.pvt.id
    vpc_security_group_ids = [ aws_security_group.SG.id ]

}