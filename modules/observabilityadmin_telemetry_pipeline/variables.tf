variable "observabilityadmin_telemetry_pipeline_name" {
  description = "(Required, Forces new resource) Name of the telemetry pipeline. Must be between 3 and 28 characters, start with a lowercase letter, and contain only lowercase letters, digits, and hyphens"
  type        = string
}
variable "observabilityadmin_telemetry_pipeline_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "observabilityadmin_telemetry_pipeline_configuration" {
  description = "(Required) Configuration block for the telemetry pipeline"
  type        = list(object({
    body = string
  }))
}
