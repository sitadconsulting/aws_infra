resource "aws_ebs_snapshot" "ebs_snapshot" {
  description            = var.ebs_snapshot_description
  outpost_arn            = var.ebs_snapshot_outpost_arn
  permanent_restore      = var.ebs_snapshot_permanent_restore
  storage_tier           = var.ebs_snapshot_storage_tier
  tags                   = var.ebs_snapshot_tags
  temporary_restore_days = var.ebs_snapshot_temporary_restore_days
  volume_id              = var.ebs_snapshot_volume_id
}
