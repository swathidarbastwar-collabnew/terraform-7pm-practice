terraform {
  backend "s3" {
    bucket = "sghdomudbsldhdse"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
