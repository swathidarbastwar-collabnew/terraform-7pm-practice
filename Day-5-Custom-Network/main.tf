resource "aws_vpc" "name" {
    tags = {
        Name = "VPC1"
    }
    cidr_block = "10.0.0.0/16"  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name = "Subnet1"
    }
}

resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "Subnet2"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.name.id
}

resource "aws_internet_gateway_attachment" "name" {
    vpc_id = aws_vpc.name.id
    internet_gateway_id = aws_internet_gateway.gw.id

}

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
  
}

resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
  
}

resource "aws_nat_gateway" "example" {
  vpc_id = aws_vpc.name.id
  connectivity_type = "private"
  subnet_id         = aws_subnet.name2.id
}

