resource "aws_config_organization_custom_policy_rule" "config_organization_custom_policy_rule" {
  debug_log_delivery_accounts = var.config_organization_custom_policy_rule_debug_log_delivery_accounts
  description                 = var.config_organization_custom_policy_rule_description
  excluded_accounts           = var.config_organization_custom_policy_rule_excluded_accounts
  input_parameters            = var.config_organization_custom_policy_rule_input_parameters
  maximum_execution_frequency = var.config_organization_custom_policy_rule_maximum_execution_frequency
  name                        = var.config_organization_custom_policy_rule_name
  policy_runtime              = var.config_organization_custom_policy_rule_policy_runtime
  policy_text                 = var.config_organization_custom_policy_rule_policy_text
  resource_id_scope           = var.config_organization_custom_policy_rule_resource_id_scope
  resource_types_scope        = var.config_organization_custom_policy_rule_resource_types_scope
  tag_key_scope               = var.config_organization_custom_policy_rule_tag_key_scope
  tag_value_scope             = var.config_organization_custom_policy_rule_tag_value_scope
  trigger_types               = var.config_organization_custom_policy_rule_trigger_types
}
