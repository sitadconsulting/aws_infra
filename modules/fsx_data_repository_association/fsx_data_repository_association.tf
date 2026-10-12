resource "aws_fsx_data_repository_association" "fsx_data_repository_association" {
  batch_import_meta_data_on_create = var.fsx_data_repository_association_batch_import_meta_data_on_create
  data_repository_path             = var.fsx_data_repository_association_data_repository_path
  delete_data_in_filesystem        = var.fsx_data_repository_association_delete_data_in_filesystem  
  file_system_id                   = var.fsx_data_repository_association_file_system_id
  file_system_path                 = var.fsx_data_repository_association_file_system_path
  imported_file_chunk_size         = var.fsx_data_repository_association_imported_file_chunk_size
  tags                             = var.fsx_data_repository_association_tags

  dynamic "s3" {
    for_each = var.fsx_data_repository_association_s3
      content {
        dynamic "auto_export_policy" {
          for_each = s3.value.auto_export_policy
            content {
              events = auto_export_policy.value["events"]
            }
        }
        dynamic "auto_import_policy" {
          for_each = s3.value.auto_import_policy
            content {
              events = auto_import_policy.value["events"]
            }
        }
      }
  }
}
