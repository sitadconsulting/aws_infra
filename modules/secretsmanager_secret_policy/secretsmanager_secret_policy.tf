resource "aws_secretsmanager_secret_policy" "secret_policy" {
  policy     = var.secret_policy_policy
  secret_arn = var.secret_policy_secret_arn
}
