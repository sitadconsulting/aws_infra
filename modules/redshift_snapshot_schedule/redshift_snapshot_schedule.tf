resource "aws_redshift_snapshot_schedule" "redshift_snapshot_schedule" {
  definitions       = var.redshift_snapshot_schedule_definitions
  description       = var.redshift_snapshot_schedule_description
  force_destroy     = var.redshift_snapshot_schedule_force_destroy
  identifier        = var.redshift_snapshot_schedule_identifier
  identifier_prefix = var.redshift_snapshot_schedule_identifier_prefix
  tags              = var.redshift_snapshot_schedule_tags
}
