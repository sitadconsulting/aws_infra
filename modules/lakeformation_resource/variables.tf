variable "lakeformation_resource_arn" {
  description = "(Required) ARN of the resource"
  type        = string
}
variable "lakeformation_resource_role_arn" {
  description = "(Optional) Role that has read/write access to the resource"
  type        = string
  default     = null
}
variable "lakeformation_resource_use_service_linked_role" {
  description = "(Optional) Designates an AWS Identity and Access Management (IAM) service-linked role by registering this role with the Data Catalog"
  type        = string
  default     = null
}
variable "lakeformation_resource_hybrid_access_enabled" {
  description = "(Optional) Flag to enable AWS Lake Formation hybrid access permission mode"
  type        = bool
  default     = null
}
variable "lakeformation_resource_with_federation" {
  description = "(Optional) Whether or not the resource is a federated resource. Set to true when registering AWS Glue connections for federated catalog functionality"
  type        = bool
  default     = null
}
variable "lakeformation_resource_with_privileged_access" {
  description = "(Optional) Boolean to grant the calling principal the permissions to perform all supported Lake Formation operations on the registered data location"
  type        = bool
  default     = null
}
