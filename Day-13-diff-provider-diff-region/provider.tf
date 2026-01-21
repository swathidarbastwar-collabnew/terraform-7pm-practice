provider "aws" {
    region = "us-west-1"
    alias = "test"
  
}

provider "aws" {
    region = "us-west-2"
    alias = "dev"
  
}