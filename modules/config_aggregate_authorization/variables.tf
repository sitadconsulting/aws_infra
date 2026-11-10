variable "config_aggregate_authorization_account_id" {
  description = " (Required) Account ID"
  type        = string
}
variable "config_aggregate_authorization_authorized_aws_region" {
  description = "(Optional) The region authorized to collect aggregated data. Exactly one of authorized_aws_region or region is required"
  type        = string
  default     = null
}
variable "config_aggregate_authorization_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
