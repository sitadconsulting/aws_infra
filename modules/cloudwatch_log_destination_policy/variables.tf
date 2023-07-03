variable "cloudwatch_log_destination_policy_access_policy" {
  description = "The policy document. This is a JSON formatted string"
  type        = string
}
variable "cloudwatch_log_destination_policy_destination_name" {
  description = "Destination name for which the policy is to be applied"
  type        = string
}
variable "cloudwatch_log_destination_policy_force_update" {
  description = "Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual AWS accounts"
  type        = bool
  default     = false
}
