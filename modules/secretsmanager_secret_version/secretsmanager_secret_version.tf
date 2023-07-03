resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id      = var.secret_version_secret_id
  secret_string  = var.secret_version_secret_string
  secret_binary  = var.secret_version_secret_binary
  version_stages = var.secret_version_version_stages
  
  lifecycle {
    ignore_changes = all
  }
}
