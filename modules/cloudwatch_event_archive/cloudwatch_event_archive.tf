resource "aws_cloudwatch_event_archive" "cloudwatch_event_archive" {
  description        = var.cloudwatch_event_archive_description
  event_pattern      = var.cloudwatch_event_archive_event_pattern
  event_source_arn   = var.cloudwatch_event_archive_event_source_arn
  kms_key_identifier = var.cloudwatch_event_archive_kms_key_identifier
  name               = var.cloudwatch_event_archive_name
  retention_days     = var.cloudwatch_event_archive_retention_days
}
