

resource "aws_vpc" "name" {
    cidr_block = var.cidrblk
    tags = {
      Name = var.vpcname
    }
  
}
resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.cidrblk1
    availability_zone = var.availzone1
    tags = {
      Name = var.subnet1
    }
  
}
resource "aws_subnet" "subnet-2" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.cidrblk2
    #availability_zone = "us-east-1b"
    tags = {
      Name = var.subnet2
    }
  
}



resource "aws_security_group" "SG" {
  name   = var.sgname
  vpc_id = aws_vpc.name.id
  tags = {
    Name = var.sgname
  }
  ingress {
    description = var.description1
    from_port   = var.from_port1
    to_port     = var.to_port1
    protocol    = var.protocol1
    cidr_blocks = var.cidrblocks1
  }

  ingress {
    description = var.description2
    from_port   = var.from_port2
    to_port     = var.to_port2
    protocol    = var.protocol2
    cidr_blocks = var.cidrblocks2
  }

  ingress {
    description = var.description3
    from_port   = var.from_port3
    to_port     = var.to_port3
    protocol    = var.protocol3
    cidr_blocks = var.cidrblocks3
  }

  egress {
    from_port   = var.from_port4
    to_port     = var.to_port4
    protocol    = var.protocol4
    cidr_blocks = var.cidrblocks4
  }
}






resource "aws_db_instance" "db666" {
  identifier        = var.identifier
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  db_name           = var.db_name
  username          = var.username
  password          = var.password
  port              = var.port
  #iam_database_authentication_enabled = true
  vpc_security_group_ids = [var.vpc_security_group_ids]
  allocated_storage = var.allocated_storage

  maintenance_window = var.maintenance_window
  backup_window      = var.backup_window
  db_subnet_group_name = var.db_subnet_group

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  # monitoring_interval    = var.monitoring_interval
  # Database Deletion Protection
  deletion_protection = var.deletion_protection
  depends_on = [ aws_db_subnet_group.custom]
  
}

resource "aws_db_subnet_group" "custom" {
  name       = var.db_subnet_group
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group
  }
}