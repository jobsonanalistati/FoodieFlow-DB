module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.77.0"

  name                 = "VPC-${var.projectName}"
  cidr                 = "172.31.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["172.31.80.0/20", "172.31.16.0/20", "172.31.32.0/20"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_db_subnet_group" "FoodieFlowVPC" {
  name       = "VPC-SUB-${var.projectName}"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = "FoodieFlowVPC"
  }
}

#vpc pelo cidr pela aws do jobson