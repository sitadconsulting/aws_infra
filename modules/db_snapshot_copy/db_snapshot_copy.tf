resource "aws_db_snapshot_copy" "db_snapshot_copy" {
  copy_tags                       = var.db_snapshot_copy_copy_tags
  destination_region              = var.db_snapshot_copy_destination_region
  kms_key_id                      = var.db_snapshot_copy_kms_key_id
  option_group_name               = var.db_snapshot_copy_option_group_name
  presigned_url                   = var.db_snapshot_copy_presigned_url
  source_db_snapshot_identifier   = var.db_snapshot_copy_source_db_snapshot_identifier
  target_custom_availability_zone = var.db_snapshot_copy_target_custom_availability_zone
  target_db_snapshot_identifier   = var.db_snapshot_copy_target_db_snapshot_identifier
  tags                            = var.db_snapshot_copy_tags
}
