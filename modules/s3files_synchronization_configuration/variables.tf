variable "s3files_synchronization_configuration_file_system_id" {
  description = "(Required) File system ID. Changing this value forces replacement"
  type        = string
}
variable "s3files_synchronization_configuration_expiration_data_rule" {
  description = "(Optional) Expiration data rule configuration"
  type        = list(object({
    days_after_last_access = number
  }))
  default     = []
}
variable "s3files_synchronization_configuration_import_data_rule" {
  description = "(Required) One or more import data rules"
  type        = list(object({
    prefix         = string
    size_less_than = number
    trigger        = string
  }))
}
