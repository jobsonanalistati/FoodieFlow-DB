terraform {
  backend "s3" {
    bucket = "terraform-foodieflow"
    key    = "rds/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.regionDefault
}
