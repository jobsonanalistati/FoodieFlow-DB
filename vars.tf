variable "regionDefault" {
  default     = "us-east-1"
  description = "aws region"
}

variable "projectName" {
  default     = "foodieflow"
  description = "project name"
}

variable "POSTGRES_USER" {
  #default     = "postgres"
  description = "The PostgreSQL user"
  sensitive   = true
}

variable "POSTGRES_PASSWORD" {
  description = "The PostgreSQL password"
  sensitive   = true
}

variable "POSTGRES_DB" {
  description = "The PostgreSQL database"
  sensitive   = true
}
