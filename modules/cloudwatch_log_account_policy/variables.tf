variable "cloudwatch_log_account_policy_policy_document" {
  description = "(Required) Text of the account policy"
  type        = string
}
variable "cloudwatch_log_account_policy_policy_type" {
  description = "(Required) Type of account policy. One of DATA_PROTECTION_POLICY, SUBSCRIPTION_FILTER_POLICY, FIELD_INDEX_POLICY or TRANSFORMER_POLICY. You can have one account policy per type in an account"
  type        = string
}
variable "cloudwatch_log_account_policy_policy_name" {
  description = "(Required) Name of the account policy"
  type        = string
}
variable "cloudwatch_log_account_policy_scope" {
  description = "(Optional) Currently defaults to and only accepts the value: ALL"
  type        = string
  default     = null
}
variable "cloudwatch_log_account_policy_selection_criteria" {
  description = "(Optional) - Criteria for applying a subscription filter policy to a selection of log groups. The only allowable criteria selector is LogGroupName NOT IN []"
  type        = string
  default     = null
}
