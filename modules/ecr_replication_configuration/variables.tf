variable "ecr_replication_configuration_replication_configuration" {
  description = "Replication configuration for a registry"
  type        = list(object({
    rule = list(object({
      destination = list(object({
        region      = string
        registry_id = string 
      }))
      repository_filter = optional(list(object({
        filter      = string
        filter_type = string
      })), [])
    }))
  }))
  default     = []
}
