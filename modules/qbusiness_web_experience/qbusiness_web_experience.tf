resource "awscc_qbusiness_web_experience" "qbusiness_web_experience" {
  application_id                  = var.qbusiness_web_experience_application_id
  origins                         = var.qbusiness_web_experience_origins
  role_arn                        = var.qbusiness_web_experience_role_arn
  sample_prompts_control_mode     = var.qbusiness_web_experience_sample_prompts_control_mode
  subtitle                        = var.qbusiness_web_experience_subtitle
  tags                            = var.qbusiness_web_experience_tags
  title                           = var.qbusiness_web_experience_title
  welcome_message                 = var.qbusiness_web_experience_welcome_message
  browser_extension_configuration = var.qbusiness_web_experience_browser_extension_configuration
  customization_configuration     = var.qbusiness_web_experience_customization_configuration
  identity_provider_configuration = var.qbusiness_web_experience_identity_provider_configuration
}
