data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2"

  name                 = "VPC-${var.projectName}-rds"
  cidr                 = "172.31.0.0/16"
  azs                  = slice(data.aws_availability_zones.available.names, 0, 3)
  public_subnets       = ["172.31.80.0/20", "172.31.16.0/20", "172.31.32.0/20"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "FoodieFlowVPC-rds" {
  name       = "vpc-sub-${var.projectName}-rds"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "FoodieFlowVPC-rds"
  }
}

#vpc pelo cidr pela aws do jobson