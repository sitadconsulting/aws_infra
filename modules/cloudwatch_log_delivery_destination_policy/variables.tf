variable "cloudwatch_log_delivery_destination_policy_delivery_destination_name" {
  description = "(Required) The name of the delivery destination to assign this policy to"
  type        = string
}
variable "cloudwatch_log_delivery_destination_policy_delivery_destination_policy" {
  description = "(Required) The contents of the policy"
  type        = string
}
