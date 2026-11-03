resource "aws_cloudwatchomni_space" "cloudwatchomni_space" {
  data_access_role_arn           = var.cloudwatchomni_space_data_access_role_arn
  domain_id                      = var.cloudwatchomni_space_domain_id
  name                           = var.cloudwatchomni_space_name
  agent_core_evaluation_role_arn = var.cloudwatchomni_space_agent_core_evaluation_role_arn

  dynamic "encryption_configuration" {
    for_each = var.cloudwatchomni_space_encryption_configuration
      content {
        encryption_strategy = encryption_configuration.value["encryption_strategy"]
        kms_key_arn         = encryption_configuration.value["kms_key_arn"]
      }
  }
}
