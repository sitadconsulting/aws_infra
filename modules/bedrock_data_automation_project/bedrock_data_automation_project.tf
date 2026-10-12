resource "awscc_bedrock_data_automation_project" "bedrock_data_automation_project" {
  kms_encryption_context        = var.bedrock_data_automation_project_kms_encryption_context
  kms_key_id                    = var.bedrock_data_automation_project_kms_key_id
  project_description           = var.bedrock_data_automation_project_project_description
  project_name                  = var.bedrock_data_automation_project_name
  project_type                  = var.bedrock_data_automation_project_type
  tags                          = var.bedrock_data_automation_project_tags
  custom_output_configuration   = var.bedrock_data_automation_project_custom_output_configuration
  override_configuration        = var.bedrock_data_automation_project_override_configuration
  standard_output_configuration = var.bedrock_data_automation_project_standard_output_configuration
}
