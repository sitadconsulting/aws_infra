resource "awscc_qbusiness_plugin" "qbusiness_plugin" {
  application_id              = var.qbusiness_plugin_application_id
  display_name                = var.qbusiness_plugin_display_name 
  server_url                  = var.qbusiness_plugin_server_url
  state                       = var.qbusiness_plugin_state
  tags                        = var.qbusiness_plugin_tags
  type                        = var.qbusiness_plugin_type
  auth_configuration          = var.qbusiness_plugin_auth_configuration
  custom_plugin_configuration = var.qbusiness_plugin_custom_plugin_configuration
}
