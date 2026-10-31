variable "cloudwatch_log_destination_policy_access_policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
  type        = string
}
variable "cloudwatch_log_destination_policy_destination_name" {
  description = "(Required) Destination name for which the policy is to be applied"
  type        = string
}
variable "cloudwatch_log_destination_policy_force_update" {
  description = "(Optional) Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual AWS accounts"
  type        = bool
  default     = false
}
