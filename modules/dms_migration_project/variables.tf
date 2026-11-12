variable "dms_migration_project_description" {
  description = "(Optional) User-friendly description of the migration project"
  type        = string
  default     = null
}
variable "dms_migration_project_instance_profile_arn" {
  description = "(Required) ARN of the instance profile associated with the migration project"
  type        = string
}
variable "dms_migration_project_name" {
  description = "(Optional) User-friendly name for the migration project"
  type        = string
  default     = null
}
variable "dms_migration_project_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_migration_project_transformation_rules" {
  description = "(Optional) JSON string that specifies the transformation rules for the migration project. Homogeneous data migrations do not support transformation rules "
  type        = string
  default     = null
}
variable "dms_migration_project_schema_conversion_application_attributes" {
  description = "(Optional) Schema conversion application attributes, including the S3 bucket path and S3 role ARN"
  type        = list(object({
    s3_bucket_path     = optional(string)
    s3_bucket_role_arn = optional(string)
  }))
  default     = []
}
variable "dms_migration_project_source_data_provider_descriptor" {
  description = "(Required) Information about the source data provider"
  type        = list(object({
    data_provider_arn               = string
    secrets_manager_access_role_arn = optional(string)
    secrets_manager_secret_id       = optional(string)
  }))
}
variable "dms_migration_project_target_data_provider_descriptor" {
  description = "(Required) Information about the target data provider"
  type        = list(object({
    data_provider_arn               = string
    secrets_manager_access_role_arn = optional(string)
    secrets_manager_secret_id       = optional(string)
  }))
}
