variable "synthetics_group_association_group_name" {
  description = "(Required) Name of the group that the canary will be associated with"
  type        = string
}
variable "synthetics_group_association_canary_arn" {
  description = "(Required) ARN of the canary"
  type        = string
}
