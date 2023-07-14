variable "athena_workgroup_description" {
  description = "Description of the workgroup"
  type        = string
  default     = ""
}
variable "athena_workgroup_force_destroy" {
  description = "Option to delete the workgroup and its contents even if the workgroup contains any named queries"
  type        = string
  default     = false
}
variable "athena_workgroup_name" {
  description = "Name of the workgroup"
  type        = string
}
variable "athena_workgroup_state" {
  description = "State of the workgroup. Valid values are DISABLED or ENABLED. Defaults to ENABLED"
  type        = string
  default     = ""
}
variable "athena_workgroup_tags" {
  description = "Key-value map of resource tags for the workgroup"
  type        = map(string)
  default     = {}
}
variable "athena_workgroup_configuration" {
  description = "Workgroup configuration settings"
  type        = list(object({
    bytes_scanned_cutoff_per_query     = optional(number)
    enforce_workgroup_configuration    = optional(bool)
    execution_role                     = optional(string)
    publish_cloudwatch_metrics_enabled = optional(bool)
    requester_pays_enabled             = optional(bool)
    engine_version = optional(list(object({
      selected_engine_version = optional(string)
    })), [])
    result_configuration = optional(list(object({
      expected_bucket_owner = optional(string)
      output_location       = optional(string)
      acl_configuration = optional(list(object({
        s3_acl_option = string
      })), [])
      encryption_configuration = optional(list(object({
        encryption_option = optional(string)
        kms_key_arn       = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
