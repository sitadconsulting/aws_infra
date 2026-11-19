resource "aws_cloudwatch_event_bus" "cloudwatch_event_bus" {
  description        = var.cloudwatch_event_bus_description 
  event_source_name  = var.cloudwatch_event_bus_event_source_name
  kms_key_identifier = var.cloudwatch_event_bus_kms_key_identifier
  name               = var.cloudwatch_event_bus_name
  tags               = var.cloudwatch_event_bus_tags

  dynamic "dead_letter_config" {
    for_each = var.cloudwatch_event_bus_dead_letter_config
      content {
        arn = dead_letter_config.value["arn"]
      }
  }
  dynamic "log_config" {
    for_each = var.cloudwatch_event_bus_log_config
      content {
        include_detail = log_config.value["include_detail"]
        level          = log_config.value["level"]
      }
  }
}
