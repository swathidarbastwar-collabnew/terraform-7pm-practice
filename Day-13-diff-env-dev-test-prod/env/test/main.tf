

provider "aws" {
  region = var.region
  profile = var.profile
}

module "vpc" {
  source              = "../../module/vpc"
  cidr_block          = var.vpc_cidr             # ✅ Correct name
  availability_zone   = var.availability_zone      # ✅ Correct name
  public_subnet_cidr  = var.public_subnet_cidr     # ✅ Correct name
  env                 = var.env
        
}

module "ec2" {
  source        = "../../module/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  env           = var.env
 subnet_id     = module.vpc.public_subnet_id
  
}