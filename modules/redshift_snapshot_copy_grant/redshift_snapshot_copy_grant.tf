resource "aws_redshift_snapshot_copy_grant" "redshift_snapshot_copy_grant" {
  kms_key_id               = var.redshift_snapshot_copy_grant_kms_key_id
  snapshot_copy_grant_name = var.redshift_snapshot_copy_grant_snapshot_copy_grant_name
  tags                     = var.redshift_snapshot_copy_grant_tags
}
