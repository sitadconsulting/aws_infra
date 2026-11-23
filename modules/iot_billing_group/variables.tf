variable "iot_billing_group_name" {
  description = "(Required) The name of the Billing Group"
  type        = string
}
variable "iot_billing_group_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "iot_billing_group_properties" {
  description = "(Optional) The Billing Group properties"
  type        = list(object({
    description = optional(string)
  }))
  default     = []
}
