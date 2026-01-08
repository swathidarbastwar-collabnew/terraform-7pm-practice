provider "aws" {
  
}

module "prod" {
  source = "../Day-8-modules"
  ami_id = "ami-068c0051b15cdb816"
  type = "t3.micro"
  env = "Prod"
}