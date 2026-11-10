variable "cloudtrail_event_data_store_billing_mode" {
  description = "(Optional) The billing mode for the event data store. The valid values are EXTENDABLE_RETENTION_PRICING and FIXED_RETENTION_PRICING. Defaults to EXTENDABLE_RETENTION_PRICING"
  type        = string
  default     = null
}
variable "cloudtrail_event_data_store_kms_key_id" {
  description = "Specifies the AWS KMS key ID to use to encrypt the events delivered by CloudTrail. The value can be an alias name prefixed by alias/, a fully specified ARN to an alias, a fully specified ARN to a key, or a globally unique identifier"
  type        = string
  default     = null
}
variable "cloudtrail_event_data_store_multi_region_enabled" {
  description = "(Optional) Specifies whether the event data store includes events from all regions, or only from the region in which the event data store is created. Default: true"
  type        = bool
  default     = true
}
variable "cloudtrail_event_data_store_name" {
  description = "(Required) The name of the event data store"
  type        = string
}
variable "cloudtrail_event_data_store_organization_enabled" {
  description = "(Optional) Specifies whether an event data store collects events logged for an organization in AWS Organizations. Default: false"
  type        = bool
  default     = false
}
variable "cloudtrail_event_data_store_retention_period" {
  description = "(Optional) The retention period of the event data store, in days. You can set a retention period of up to 2555 days, the equivalent of seven years. Default: 2555"
  type        = number
  default     = null
}
variable "cloudtrail_event_data_store_suspend" {
  description = "(Optional) Specifies whether to stop ingesting new events into the event data store. If set to true, ingestion is suspended while maintaining the ability to query existing events. If set to false, ingestion is active"
  type        = bool
  default     = null
}
variable "cloudtrail_event_data_store_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudtrail_event_data_store_termination_protection_enabled" {
  description = "(Optional) Specifies whether termination protection is enabled for the event data store. If termination protection is enabled, you cannot delete the event data store until termination protection is disabled. Default: true"
  type        = bool
  default     = null
}
variable "cloudtrail_event_data_store_advanced_event_selector" {
  description = "(Optional) The advanced event selectors to use to select the events for the data store"
  type        = list(object({
    name           = optional(string)
    field_selector = optional(list(object({
      ends_with       = optional(list(string))
      equals          = optional(list(string))
      field           = string
      not_ends_with   = optional(list(string))
      not_equals      = optional(list(string))
      not_starts_with = optional(list(string))
      starts_with     = optional(list(string))
    })), [])
  }))
  default     = []
}
