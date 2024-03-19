resource "aws_db_parameter_group" "FoodieFlowDBParameters-app" {
  name   = "parameterdb-${var.projectName}-app"
  family = "postgres16"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }
}
