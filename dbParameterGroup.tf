resource "aws_db_parameter_group" "FoodieFlowDBParameters" {
  name   = "parameterdb-${var.projectName}"
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
