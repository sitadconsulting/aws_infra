variable "emrserverless_application_architecture" {
  description = "(Optional) The CPU architecture of an application. Valid values are ARM64 or X86_64. Default value is X86_64"
  type        = string
  default     = null
}
variable "emrserverless_application_name" {
  description = "(Required) The name of the application"
  type        = string
}
variable "emrserverless_application_release_label" {
  description = "(Required) The EMR release version associated with the application"
  type        = string
}
variable "emrserverless_application_type" {
  description = "(Required) The type of application you want to start, such as spark or hive"
  type        = string
}
variable "emrserverless_application_tags" {
  description = "(Optional) Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
variable "emrserverless_application_auto_start_configuration" {
  description = "(Optional) The configuration for an application to automatically start on job submission."
  type        = list(object({
    enabled = optional(bool)
  }))
  default     = []
}
variable "emrserverless_application_auto_stop_configuration" {
  description = "(Optional) The configuration for an application to automatically stop after a certain amount of time being idle"
  type        = list(object({
    enabled              = optional(bool)
    idle_timeout_minutes = optional(number) 
  }))
  default     = []
}
variable "emrserverless_application_image_configuration" {
  description = "(Optional) The image configuration applied to all worker types"
  type        = list(object({
    image_uri = string
  }))
  default     = []
}
variable "emrserverless_application_initial_capacity" {
  description = "(Optional) The capacity to initialize when the application is created"
  type        = list(object({
    initial_capacity_type   = string
    initial_capacity_config = optional(list(object({
      worker_count         = number
      worker_configuration = optional(list(object({
        cpu    = string
        disk   = optional(string)
        memory = string
      })), [])
    })), [])
  }))
  default     = []
}
variable "emrserverless_application_interactive_configuration" {
  description = "(Optional) Enables the interactive use cases to use when running an application"
  type        = list(object({
    livy_endpoint_enabled = optional(bool)
    studio_enabled        = optional(bool)
  }))
  default     = []
}
variable "emrserverless_application_maximum_capacity" {
  description = "(Optional) The maximum capacity to allocate when the application is created. This is cumulative across all workers at any given point in time, not just when an application is created. No new resources will be created once any one of the defined limits is hit"
  type        = list(object({
    cpu    = string
    disk   = optional(string)
    memory = string
  }))
  default     = []
}
variable "emrserverless_application_monitoring_configuration" {
  description = "(Optional) The configuration setting for monitoring"
  type        = list(object({
    cloudwatch_logging_configuration = optional(list(object({
      enabled                = bool
      log_group_name         = optional(string)
      log_stream_name_prefix = optional(string)
      encryption_key_arn     = optional(string)
      log_types              = optional(list(object({
        name   = string
        values = list(string)
      })), [])
    })), [])
    managed_persistence_monitoring_configuration = optional(list(object({
      enabled            = optional(bool)
      encryption_key_arn = optional(string)
    })), [])
    prometheus_monitoring_configuration = optional(list(object({
      remote_write_url = optional(string)
    })), []) 
    s3_monitoring_configuration = optional(list(object({
      log_uri            = optional(string)
      encryption_key_arn = optional(string)
    })), [])
  }))
  default     = []
}
variable "emrserverless_application_network_configuration" {
  description = "(Optional) The network configuration for customer VPC connectivity"
  type        = list(object({
    security_group_ids = optional(list(string))
    subnet_ids         = optional(list(string))
  }))
  default     = []
}
variable "emrserverless_application_runtime_configuration" {
  description = "(Optional) A configuration specification to be used when provisioning an application. A configuration consists of a classification, properties, and optional nested configurations. A classification refers to an application-specific configuration file. Properties are the settings you want to change in that file"
  type        = list(object({
    classification = string
    properties     = optional(map(string))
  }))
  default     = []
}
variable "emrserverless_application_scheduler_configuration" {
  description = "(Optional) Scheduler configuration for batch and streaming jobs running on this application. Supported with release labels emr-7.0.0 and above"
  type        = list(object({
    max_concurrent_runs   = optional(number)
    queue_timeout_minutes = optional(number)
  }))
  default     = []
}
