variable "config_organization_custom_policy_rule_debug_log_delivery_accounts" {
  description = "(Optional) List of accounts that you can enable debug logging for. The list is null when debug logging is enabled for all accounts"
  type        = list(string)
  default     = null
}
variable "config_organization_custom_policy_rule_description" {
  description = "(Optional) Description of the rule"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_excluded_accounts" {
  description = "(Optional) List of AWS account identifiers to exclude from the rule"
  type        = list(string)
  default     = null
}
variable "config_organization_custom_policy_rule_input_parameters" {
  description = "(Optional) A string in JSON format that is passed to the AWS Config Rule Lambda Function"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_maximum_execution_frequency" {
  description = "(Optional) Maximum frequency with which AWS Config runs evaluations for a rule, if the rule is triggered at a periodic frequency. Defaults to TwentyFour_Hours for periodic frequency triggered rules. Valid values: One_Hour, Three_Hours, Six_Hours, Twelve_Hours, or TwentyFour_Hours"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_name" {
  description = "(Required) Name of the rule"
  type        = string
}
variable "config_organization_custom_policy_rule_policy_runtime" {
  description = "(Required) Runtime system for policy rules"
  type        = string
}
variable "config_organization_custom_policy_rule_policy_text" {
  description = "(Required) Policy definition containing the rule logic"
  type        = string
}
variable "config_organization_custom_policy_rule_resource_id_scope" {
  description = "(Optional) Identifier of the AWS resource to evaluate"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_resource_types_scope" {
  description = "(Optional) List of types of AWS resources to evaluate"
  type        = list(string)
  default     =
}
variable "config_organization_custom_policy_rule_tag_key_scope" {
  description = "(Optional, Required if tag_value_scope is configured) Tag key of AWS resources to evaluate"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_tag_value_scope" {
  description = "(Optional) Tag value of AWS resources to evaluate"
  type        = string
  default     = null
}
variable "config_organization_custom_policy_rule_trigger_types" {
  description = "(Required) List of notification types that trigger AWS Config to run an evaluation for the rule. Valid values: ConfigurationItemChangeNotification, OversizedConfigurationItemChangeNotification"
  type        = list(string)
}
