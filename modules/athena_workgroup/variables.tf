variable "athena_workgroup_description" {
  description = "(Optional) Description of the workgroup"
  type        = string
  default     = null
}
variable "athena_workgroup_force_destroy" {
  description = "(Optional) Option to delete the workgroup and its contents even if the workgroup contains any named queries"
  type        = string
  default     = false
}
variable "athena_workgroup_name" {
  description = "(Required) Name of the workgroup"
  type        = string
}
variable "athena_workgroup_state" {
  description = "(Optional) State of the workgroup. Valid values are DISABLED or ENABLED. Defaults to ENABLED"
  type        = string
  default     = null
}
variable "athena_workgroup_tags" {
  description = "(Optional) Key-value map of resource tags for the workgroup"
  type        = map(string)
  default     = {}
}
variable "athena_workgroup_configuration" {
  description = "(Optional) Configuration block with various settings for the workgroup"
  type        = list(object({
    bytes_scanned_cutoff_per_query               = optional(number)
    enforce_workgroup_configuration              = optional(bool)
    execution_role                               = optional(string)
    publish_cloudwatch_metrics_enabled           = optional(bool)
    requester_pays_enabled                       = optional(bool)
    customer_content_encryption_configuration    = optional(list(object({
      kms_key_arn = string
    })), [])
    engine_version                               = optional(list(object({
      selected_engine_version = optional(string)
    })), [])
    identity_center_configuration                = optional(list(object({
      enable_identity_center       = optional(bool)
      identity_center_instance_arn = optional(string)
    })), [])
    monitoring_configuration                     = optional(list(object({
      cloud_watch_logging_configuration = optional(list(object({
        enabled                = bool
        log_group              = optional(string)
        log_stream_name_prefix = optional(string)
        log_type               = optional(list(object({
          key    = string
          values = list(string)
        })), [])
      })), [])
      managed_logging_configuration     = optional(list(object({
        enabled  = bool
        kms_keys = optional(string)
      })), [])
      s3_logging_configuration          = optional(list(object({
        enabled      = bool
        kms_key      = optional(string)
        log_location = optional(string)
      })), [])
    })), [])
    query_results_s3_access_grants_configuration = optional(list(object({
      authentication_type      = string
      create_user_level_prefix = optional(bool)
      enable_s3_access_grants  = bool
    })), [])
    result_configuration                         = optional(list(object({
      expected_bucket_owner = optional(string)
      output_location       = optional(string)
      acl_configuration = optional(list(object({
        s3_acl_option = string
      })), [])
      encryption_configuration                   = optional(list(object({
        encryption_option = optional(string)
        kms_key_arn       = optional(string)
      })), [])
    })), [])
    managed_query_results_configuration          = optional(list(object({
      enabled                  = bool
      encryption_configuration = optional(list(object({
        kms_key = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
