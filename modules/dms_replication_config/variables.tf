variable "dms_replication_config_replication_config_identifier" {
  description = "(Required) Unique identifier that you want to use to create the config"
  type        = string
}
variable "dms_replication_config_replication_settings" {
  description = "(Optional) An escaped JSON string that are used to provision this replication configuration"
  type        = string
  default     = null
}
variable "dms_replication_config_replication_type" {
  description = "(Required) The migration type. Can be one of full-load | cdc | full-load-and-cdc"
  type        = string
}
variable "dms_replication_config_resource_identifier" {
  description = "(Optional) Unique value or name that you set for a given resource that can be used to construct an ARN for that resource"
  type        = string
  default     = null
}
variable "dms_replication_config_source_endpoint_arn" {
  description = "(Required) ARN string that uniquely identifies the source endpoint"
  type        = string
}
variable "dms_replication_config_start_replication" {
  description = "(Optional) Whether to run or stop the serverless replication, default is false"
  type        = bool
  default     = false
}
variable "dms_replication_config_supplemental_settings" {
  description = "(Optional) JSON settings for specifying supplemental data"
  type        = string
  default     = null
}
variable "dms_replication_config_table_mappings" {
  description = "(Required) An escaped JSON string that contains the table mappings"
  type        = string
}
variable "dms_replication_config_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "dms_replication_config_target_endpoint_arn" {
  description = "(Required) ARN string that uniquely identifies the target endpoint"
  type        = string
}
variable "dms_replication_config_compute_config" {
  description = "(Required) Configuration block for provisioning an DMS Serverless replication"
  type        = list(object({
    availability_zone            = optional(string)
    dns_name_servers             = optional(string)
    kms_key_id                   = optional(string)
    max_capacity_units           = optional(number)
    min_capacity_units           = optional(number)
    multi_az                     = optional(bool)
    preferred_maintenance_window = optional(string)
    replication_subnet_group_id  = string
    vpc_security_group_ids       = optional(list(string))
  }))
}
