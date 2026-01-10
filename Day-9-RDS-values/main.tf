provider "aws" {
  
}

module "vpcsub" {
  source = "../Day-9-cust-RDS-module"
  vpcname = "VPC-1"
  subnet1 = "mysub-1"
  subnet2 = "mysub-2"
  cidrblk = "10.0.0.0/16"
  availzone1 = "us-east-1a"
  cidrblk1 = "10.0.1.0/24"
  cidrblk2 = "10.0.0.0/28" 

  sgname = "mynewsg"

  description1 = "HTTP"
  from_port1 = 80
  to_port1 =  80
  protocol1 = "TCP"

  description2 = "SSH"
  from_port2 = 22
  to_port2 =  22
  protocol2 = "TCP"

  description3 = "HTTPS"
  from_port3 = 443
  to_port3 =  443
  protocol3 = "TCP"

  from_port4 = 0
  to_port4 =  0
  protocol4 = "-1"



  cidrblocks1 = ["0.0.0.0/0"]
  cidrblocks2 = ["0.0.0.0/0"]
  cidrblocks3 = ["0.0.0.0/0"]
  cidrblocks4 = ["0.0.0.0/0"]



  identifier = "mynewdb123"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t4g.micro"
  allocated_storage = 5

  db_name  = "demodb"
  username = "user"
  password = "Cloud1223456"
  port     = "3306"

  #iam_database_authentication_enabled = true

  vpc_security_group_ids = "sg-03ec51671e065bc2c"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  # monitoring_interval    = "30"

  # DB subnet group
  db_subnet_group = "newsubnetgrp123"
  subnet_ids = ["subnet-0ae34bbe31d4935bb", "subnet-0e97b200cdfdddb63"]
  # Database Deletion Protection
  deletion_protection = true

}
