terraform {
  backend "s3" {
    bucket = "s3-state-dev-harshi"
    key = "terraform.tfstate"
    region = "ap-south-2"
    encrypt = true
  }
}