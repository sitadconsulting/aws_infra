variable "appfabric_ingestion_app" {
  description = "(Required) Name of the application"
  type        = string
}
variable "appfabric_ingestion_app_bundle_arn" {
  description = "(Required) ARN of the app bundle to use for the request"
  type        = string
}
variable "appfabric_ingestion_ingestion_type" {
  description = "(Required) Ingestion type. Valid values are auditLog"
  type        = string
}
variable "appfabric_ingestion_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appfabric_ingestion_tenant_id" {
  description = "(Required) ID of the application tenant"
  type        = string
}
