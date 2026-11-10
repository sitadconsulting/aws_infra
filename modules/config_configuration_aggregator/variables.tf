variable "config_configuration_aggregator_name" {
  description = "(Required) The name of the configuration aggregator"
  type        = string
}
variable "config_configuration_aggregator_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "config_configuration_aggregator_account_aggregation_source" {
  description = "(Optional) The account(s) to aggregate config data from"
  type        = list(object({
    account_ids = list(string)
    all_regions = optional(bool)
    regions     = optional(list(string))
  }))
  default     = []
}
variable "config_configuration_aggregator_organization_aggregation_source" {
  description = "(Optional) The organization to aggregate config data from"
  type        = list(object({
    all_regions = optional(bool)
    regions     = optional(list(string))
    role_arn    = string
  }))
  default     = []
}
