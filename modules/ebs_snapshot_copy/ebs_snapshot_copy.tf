resource "aws_ebs_snapshot_copy" "ebs_snapshot_copy" {
  completion_duration_minutes = var.ebs_snapshot_copy_completion_duration_minutes
  description                 = var.ebs_snapshot_copy_description
  encrypted                   = var.ebs_snapshot_copy_encrypted
  kms_key_id                  = var.ebs_snapshot_copy_kms_key_id
  permanent_restore           = var.ebs_snapshot_copy_permanent_restore
  source_snapshot_id          = var.ebs_snapshot_copy_source_snapshot_id
  source_region               = var.ebs_snapshot_copy_source_region
  storage_tier                = var.ebs_snapshot_copy_storage_tier
  tags                        = var.ebs_snapshot_copy_tags
  temporary_restore_days      = var.ebs_snapshot_copy_temporary_restore_days
}
