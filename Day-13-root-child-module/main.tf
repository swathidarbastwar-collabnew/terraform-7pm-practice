provider "aws" {
  
}


module "vpc" {
  source       = "./module/vpc"
  cidr_block   = "10.0.0.0/16"
  subnet_1_cidr  = "10.0.1.0/24"
  subnet_2_cidr = "10.0.2.0/24"
  az1           = "us-east-1a"
  az2           = "us-east-1b"
}

 module "ec2" {
   source        = "./module/ec2"
   ami_id        = "ami-068c0051b15cdb816"  # Replace with valid AMI
   instance_type = "t3.micro"
   subnet_1_id     = module.vpc.subnet_1_id
}

module "rds" {
  source         = "./module/RDS"
  subnet_1_id      = module.vpc.subnet_1_id
  subnet_2_id      = module.vpc.subnet_2_id
  instance_class = "db.t4g.micro"
  db_name        = "mydb"
  db_user        = "admin"
  db_password    = "Admin12345"
}

module "s3" {
    source = "./module/S3"
    bucket = "wertyuisdfghjxcfvgh"
  

}