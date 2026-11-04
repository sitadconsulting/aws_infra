variable "appfabric_app_bundle_customer_managed_key_arn" {
  description = "(Optional) ARN of the KMS key to use to encrypt the application data. If this is not specified, an AWS owned key is used for encryption"
  type        = string
  default     = null
}
variable "appfabric_app_bundle_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
