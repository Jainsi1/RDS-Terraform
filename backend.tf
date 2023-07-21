terraform {
  backend "s3" {
    bucket = "manjainmanjain"
    key = "rds/terraform.tfstate"
    region = "us-east-1"
  }
}