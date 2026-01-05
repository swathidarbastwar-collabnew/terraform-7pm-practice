terraform {
  backend "s3" {
    bucket = "sghdomudbsldhdse"
    key    = "day-4/terraform.tfstate"
    region = "us-east-1"
  }
}
