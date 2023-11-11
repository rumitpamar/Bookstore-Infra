resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = [for subnet in aws_subnet.private_subnets : subnet.id]
}
resource "aws_db_instance" "postgres" {
  identifier              = "postgres"
  allocated_storage       = 7
  backup_retention_period = 2
  backup_window           = "01:00-01:30"
  maintenance_window      = "sun:03:00-sun:03:30"
  engine                  = "postgres"
  engine_version          = "14.7"
  instance_class          = var.db_instance_class
  username                = aws_secretsmanager_secret.db_username_secret_new3.name
  password                = aws_secretsmanager_secret.db_password_secret_new3.name

  # username                  = aws_secretsmanager_secret_version.db_username_version_new1.arn
  # password                  = aws_secretsmanager_secret_version.db_password_version_new1.arn
  port                      = "5432"
  db_subnet_group_name      = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids    = [aws_security_group.rds_sg.id, aws_security_group.ecs_sg.id]
  skip_final_snapshot       = true
  final_snapshot_identifier = "worker-final"
  publicly_accessible       = false
}
