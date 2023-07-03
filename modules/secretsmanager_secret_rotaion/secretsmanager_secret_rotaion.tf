resource "aws_secretsmanager_secret_rotation" "secret_rotation" {
  secret_id           = var.secret_rotation_secret_id
  rotation_lambda_arn = var.secret_rotation_rotation_lambda_arn

  dynamic "rotation_rules" {
    for_each = var.secret_rotation_rotation_rules
      content {
        automatically_after_days = rotation_rules.value["automatically_after_days"]
      }
  }
}
