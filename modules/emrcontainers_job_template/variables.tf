variable "emrcontainers_job_template_kms_key_arn" {
  description = "(Optional) The KMS key ARN used to encrypt the job template"
  type        = string
  default     = null
}
variable "emrcontainers_job_template_name" {
  description = "(Required) The specified name of the job template"
  type        = string
}
variable "emrcontainers_job_template_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "emrcontainers_job_template_job_template_data" {
  description = "(Required) The job template data which holds values of StartJobRun API request"
  type        = list(object({
    execution_role_arn      = string
    job_tags                = optional(map(string))
    release_label           = string
    configuration_overrides = optional(list(object({
      application_configuration = optional(list(object({
        classification = string 
        properties     = optional(map(string))
        configurations = optional(list(object({
          classification = optional(string)
          properties     = optional(map(string))
        })), [])
      })), [])
      monitoring_configuration  = optional(list(object({
        persistent_app_ui                    = optional(string)
        cloud_watch_monitoring_configuration = optional(list(object({
          log_group_name         = string
          log_stream_name_prefix = optional(string)
        })), [])
        s3_monitoring_configuration          = optional(list(object({
          log_uri = string
        })), []) 
      })), []) 
    })), [])
    job_driver              = list(object({
      spark_sql_job_driver    = optional(list(object({
        entry_point          = optional(string)
        spark_sql_parameters = optional(string)
      })), [])
      spark_submit_job_driver = optional(list(object({
        entry_point             = string
        entry_point_arguments   = optional(list(string))
        spark_submit_parameters = optional(string)
      })), [])
    })) 
  }))
}
