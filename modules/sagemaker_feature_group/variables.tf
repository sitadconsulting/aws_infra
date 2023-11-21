variable "sagemaker_feature_group_description" {
  description = "A free-form description of a Feature Group"
  type        = string
  default     = ""
}
variable "sagemaker_feature_group_event_time_feature_name" {
  description = "The name of the feature that stores the EventTime of a Record in a Feature Group"
  type        = string
}
variable "sagemaker_feature_group_feature_group_name" {
  description = "The name of the Feature Group. The name must be unique within an AWS Region in an AWS account"
  type        = string
}
variable "sagemaker_feature_group_record_identifier_feature_name" {
  description = "The name of the Feature whose value uniquely identifies a Record defined in the Feature Store. Only the latest record per identifier value will be stored in the Online Store"
  type        = string
}
variable "sagemaker_feature_group_role_arn" {
  description = "ARN of the IAM execution role used to persist data into the Offline Store if an offline_store_config is provided"
  type        = string
}
variable "sagemaker_feature_group_tags" {
  description = "Map of resource tags for the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "sagemaker_feature_group_feature_definition" {
  description = "A list of Feature names and types"
  type        = list(object({
    feature_name = optional(string)
    feature_type = optional(string)
  }))
}
variable "sagemaker_feature_group_offline_store_config" {
  description = "The Offline Feature Store Configuration"
  type        = list(object({
    disable_glue_table_creation = optional(bool)
    table_format                = optional(string)
    data_catalog_config = optional(list(object({
      catalog    = optional(string)
      database   = optional(string)
      table_name = optional(string)
    })), [])
    s3_storage_config = list(object({
      kms_key_id             = optional(string)
      resolved_output_s3_uri = optional(string)
      s3_uri                 = string
    }))
  }))
  default     = []
}
variable "sagemaker_feature_group_online_store_config" {
  description = "The Online Feature Store Configuration"
  type        = list(object({
    enable_online_store = optional(bool)
    storage_type        = optional(string)
    security_config     = optional(list(object({
      kms_key_id = optional(string)
    })), [])
    ttl_duration        = optional(list(object({
      unit  = optional(string)
      value = optional(number)
    })), [])
  }))
  default     = []
}
