resource "aws_secretsmanager_secret" "foodieFlow_secret" {
  name = "foodieFlow_secret"
}

resource "aws_secretsmanager_secret_version" "foodieFlow_secret" {
  secret_id = aws_secretsmanager_secret.foodieFlow_secret.id
  secret_string = jsonencode({
    host     = aws_db_instance.FoodieFlowRds.address,
    db_name  = var.POSTGRES_DB,
    username = var.POSTGRES_USER,
    password = var.POSTGRES_PASSWORD
  })
}