# Define the Secrets Manager secret for username
resource "aws_secretsmanager_secret" "db_username_secret_new4" {
  name = "TopSecretUsernameSecret"  # Change the name
}

# Load the template file for username
data "template_file" "username" {
  template = file("secret_username.json")
}

# Create the secret version for username
resource "aws_secretsmanager_secret_version" "db_username_version_new4" {
  secret_id     = aws_secretsmanager_secret.db_username_secret_new4.id
  secret_string = data.template_file.username.rendered
}

# Define the Secrets Manager secret for password
resource "aws_secretsmanager_secret" "db_password_secret_new4" {
  name = "ClassifiedPasswordSecret"  # Change the name
}

# Load the template file for password
data "template_file" "password" {
  template = file("secret_password.json")
}

# Create the secret version for password
resource "aws_secretsmanager_secret_version" "db_password_version_new4" {
  secret_id     = aws_secretsmanager_secret.db_password_secret_new4.id
  secret_string = data.template_file.password.rendered
}
