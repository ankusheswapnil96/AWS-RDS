provider "aws"{
  region = "us-east-1"
}
resource "aws_db_instance" "default" {
  allocated_storage                   = 20
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t2.micro"
  # name                              = "mydb"
  username                            = "foo"
  password                            = var.database_password  # Use a variable
  parameter_group_name                = "default.mysql5.7"
  iam_database_authentication_enabled = true
  publicly_accessible                 = true
  skip_final_snapshot                 = true
}

resource "null_resource" "run_sql" {
  depends_on = [aws_db_instance.default]

  provisioner "local-exec" {
    command = <<EOT
      mysql --host=${aws_db_instance.default.address} \
            --port=${aws_db_instance.default.port} \
            --user=${aws_db_instance.default.username} \
            --password=${var.database_password} < file.sql
    EOT
  }
}
