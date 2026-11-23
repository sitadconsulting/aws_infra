variable "iot_policy_attachment_policy" {
  description = "(Required) The name of the policy to attach"
  type        = string
}
variable "iot_policy_attachment_target" {
  description = "(Required) The identity to which the policy is attached"
  type        = string
}
