variable "POSTGRES_USER" {
  description = "The PostgreSQL user"
  default     = "postgres"
}

variable "POSTGRES_PASSWORD" {
  description = "The PostgreSQL password"
  default     = "postgres"
}

variable "POSTGRES_DB" {
  description = "The PostgreSQL database"
  default     = "FIAP"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "bd-soat3" {
    allocated_storage = 10
    engine = "postgres"
    engine_version = "13.3"
    instance_class = "db.t2.micro"
    db_name = var.POSTGRES_DB
    username = var.POSTGRES_USER
    password = var.POSTGRES_PASSWORD
    skip_final_snapshot = true
    #db_subnet_group_name = aws_db_subnet_group.db_subnet.id
}

# resource "aws_db_subnet_group" "db_subnet" {
#     name = "dbsubnet"
#     subnet_ids = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
# }
