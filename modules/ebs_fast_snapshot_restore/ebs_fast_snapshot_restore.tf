resource "aws_ebs_fast_snapshot_restore" "ebs_fast_snapshot_restore" {
  availability_zone = var.ebs_fast_snapshot_restore_availability_zone
  snapshot_id       = var.ebs_fast_snapshot_restore_snapshot_id
}
