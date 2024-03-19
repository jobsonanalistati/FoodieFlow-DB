resource "aws_secretsmanager_secret" "foodieFlow" {
  name = "foodieFlow"
}

resource "aws_secretsmanager_secret_version" "foodieFlow" {
  secret_id = aws_secretsmanager_secret.foodieFlow.id
  secret_string = jsonencode({
    host     = aws_db_instance.FoodieFlowRds.address,
    db_name  = var.POSTGRES_DB,
    username = var.POSTGRES_USER,
    password = var.POSTGRES_PASSWORD
  })
}