resource "aws_db_instance" "FoodieFlowRds" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "16.1"
  instance_class       = "db.t3.micro"
  identifier           = "rds-${var.projectName}"
  db_name              = var.POSTGRES_DB
  username             = var.POSTGRES_USER
  password             = var.POSTGRES_PASSWORD
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.FoodieFlowVPC.name
  parameter_group_name = aws_db_parameter_group.FoodieFlowDBParameters.name

  tags = {
    Project     = var.projectName
    Terraform   = "true"
    Environment = "prod"
  }
}

# mult_az - multi regiões
# identifier - aws name
#ver vpc
