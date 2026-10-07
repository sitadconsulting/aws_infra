resource "aws_s3files_synchronization_configuration" "s3files_synchronization_configuration" {
  file_system_id = var.s3files_synchronization_configuration_file_system_id

  dynamic "expiration_data_rule" {
    for_each = var.s3files_synchronization_configuration_expiration_data_rule
      content {
        days_after_last_access = expiration_data_rule.value["days_after_last_access"]
      }
  }
  dynamic "import_data_rule" {
    for_each = var.s3files_synchronization_configuration_import_data_rule
      content {
        prefix         = import_data_rule.value["prefix"]
        size_less_than = import_data_rule.value["size_less_than"]
        trigger        = import_data_rule.value["trigger"]
      }
  }
}
