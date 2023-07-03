resource "aws_secretsmanager_secret" "secret" {
  description                    = var.secret_description
  kms_key_id                     = var.secret_kms_key_id
  name                           = var.secret_name
  policy                         = var.secret_policy
  recovery_window_in_days        = var.secret_recovery_window_in_days
  force_overwrite_replica_secret = var.secret_force_overwrite_replica_secret
  tags                           = var.secret_tags

  dynamic "replica" {
    for_each = var.secret_replica
      content {
        kms_key_id = replica.value["kms_key_id"]
        region     = replica.value["region"]
      }
  }
}


