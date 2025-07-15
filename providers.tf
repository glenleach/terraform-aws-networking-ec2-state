provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "devops-bootcamp-tf-state-xxxxxx" # Replace with your actual bucket name after apply
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
