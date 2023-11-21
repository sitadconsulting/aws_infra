variable "ecr_registry_scanning_configuration_scan_type" {
  description = "The scanning type to set for the registry. Can be either ENHANCED or BASIC"
  type        = string
}
variable "ecr_registry_scanning_configuration_rule" {
  description = "One or multiple blocks specifying scanning rules to determine which repository filters are used and at what frequency scanning will occur"
  type        = list(object({
    scan_frequency = string
    repository_filter = list(object({
      filter      = string
      filter_type = string
    }))
  }))
  default     = []
}
