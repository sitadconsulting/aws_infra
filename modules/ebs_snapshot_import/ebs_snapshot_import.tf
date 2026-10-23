resource "aws_ebs_snapshot_import" "ebs_snapshot_import" {
  description            = var.ebs_snapshot_import_description
  encrypted              = var.ebs_snapshot_import_encrypted
  kms_key_id             = var.ebs_snapshot_import_kms_key_id
  permanent_restore      = var.ebs_snapshot_import_permanent_restore
  role_name              = var.ebs_snapshot_import_role_name
  storage_tier           = var.ebs_snapshot_import_storage_tier
  tags                   = var.ebs_snapshot_import_tags
  temporary_restore_days = var.ebs_snapshot_import_temporary_restore_days

  dynamic "client_data" {
    for_each = var.ebs_snapshot_import_client_data
      content {
        comment      = client_data.value["comment"]
        upload_start = client_data.value["upload_start"]
        upload_end   = client_data.value["upload_end"]
        upload_size  = client_data.value["upload_size"]
      }
  }
  dynamic "disk_container" {
    for_each = var.ebs_snapshot_import_disk_container
      content {
        description = disk_container.value["description"]
        format      = disk_container.value["format"]
        url         = disk_container.value["url"]
        dynamic "user_bucket" {
          for_each = disk_container.value.user_bucket
            content {
              s3_bucket = user_bucket.value["s3_bucket"]
              s3_key    = user_bucket.value["s3_key"]
            }
        }
      }
  }
}
