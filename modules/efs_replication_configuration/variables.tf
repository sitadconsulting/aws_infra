variable "efs_replication_configuration_source_file_system_id" {
  description = "The ID of the file system that is to be replicated"
  type        = string
}
variable "efs_replication_configuration_destination" {
  description = "A destination configuration block"
  type        = list(object({
    availability_zone_name = optional(string)
    kms_key_id             = optional(string)
    region                 = optional(string)
  }))
}
