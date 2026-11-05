resource "aws_appintegrations_data_integration" "appintegrations_data_integration" {
  description = var.appintegrations_data_integration_description
  kms_key     = var.appintegrations_data_integration_kms_key
  name        = var.appintegrations_data_integration_name
  source_uri  = var.appintegrations_data_integration_source_uri
  tags        = var.appintegrations_data_integration_tags

  dynamic "schedule_config" {
    for_each = var.appintegrations_data_integration_schedule_config
      content {
        first_execution_from = schedule_config.value["first_execution_from"]
        object               = schedule_config.value["object"]
        schedule_expression  = schedule_config.value["schedule_expression"]
      }
  }
}
