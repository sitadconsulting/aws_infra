resource "aws_grafana_workspace" "grafana_workspace" {
  account_access_type       = var.grafana_workspace_account_access_type
  authentication_providers  = var.grafana_workspace_authentication_providers
  configuration             = var.grafana_workspace_configuration
  data_sources              = var.grafana_workspace_data_sources
  description               = var.grafana_workspace_description
  grafana_version           = var.grafana_workspace_grafana_version
  kms_key_id                = var.grafana_workspace_kms_key_id
  name                      = var.grafana_workspace_name
  notification_destinations = var.grafana_workspace_notification_destinations
  organization_role_name    = var.grafana_workspace_organization_role_name
  organizational_units      = var.grafana_workspace_organizational_units
  permission_type           = var.grafana_workspace_permission_type
  role_arn                  = var.grafana_workspace_role_arn
  stack_set_name            = var.grafana_workspace_stack_set_name
  tags                      = var.grafana_workspace_tags

  dynamic "network_access_control" {
    for_each = var.grafana_workspace_network_access_control
      content {
        prefix_list_ids = network_access_control.value["prefix_list_ids"]
        vpce_ids        = network_access_control.value["vpce_ids"]
      }
  }
  dynamic "vpc_configuration" {
    for_each = var.grafana_workspace_vpc_configuration
     content {
       security_group_ids = vpc_configuration.value["security_group_ids"]
       subnet_ids         = vpc_configuration.value["subnet_ids"]
     }
  }
}
