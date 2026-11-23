variable "iot_policy_name" {
  description = "(Required) The name of the policy"
  type        = string
}
variable "iot_policy_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
}
variable "iot_policy_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
