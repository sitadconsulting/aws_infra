variable "cloudwatch_log_group_log_group_name" {
  description = "(Required) Log group name to set the policy for"
  type        = string
}
variable "cloudwatch_log_group_policy_document" {
  description = "(Required) JSON policy document. This is a JSON formatted string"
  type        = string
}
