provider "aws" {
  region = "eu-west-2"
}

# NOTE: Backend blocks do not support variable interpolation. Ensure the bucket name matches your state_bucket_name variable in terraform.tfvars.
terraform {
  backend "s3" {
    bucket = "terrafom-backup-state-glenleach1974" # Must match var.state_bucket_name
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
