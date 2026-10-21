variable "lakeformation_identity_center_configuration_catalog_id" {
  description = "(Optional) Identifier for the Data Catalog. By default, the account ID"
  type        = string
  default     = null
}
variable "lakeformation_identity_center_configuration_instance_arn" {
  description = "(Required) ARN of the IAM Identity Center Instance to associate"
  type        = string
}
