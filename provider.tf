terraform {
  backend "s3" {
    bucket = "terraform-foodieflow-db"
    key = "rds/terraform.tfstate" 
    region ="us-east-1"
  }
}

provider "aws" {
    region = var.regionDefault
}
