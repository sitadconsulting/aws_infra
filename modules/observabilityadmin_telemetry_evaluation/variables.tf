variable "observabilityadmin_telemetry_evaluation_all_regions" {
  description = "(Optional) Whether to start telemetry evaluation in all AWS Regions where CloudWatch Observability Admin is available. The current region becomes the home region. Mutually exclusive with regions"
  type        = bool
  default     = null
}
variable "observabilityadmin_telemetry_evaluation_regions" {
  description = "(Optional) List of AWS Regions to include in multi-region telemetry evaluation. The current region is always implicitly included. Mutually exclusive with all_regions"
  type        = list(string)
  default     = null
}
