variable "s3_bucket_analytics_configuration_bucket" {
  description = "Name of the bucket this analytics configuration is associated with"
  type        = string
}
variable "s3_bucket_analytics_configuration_name" {
  description = "Unique identifier of the analytics configuration for the bucket"
  type        = string
}
variable "s3_bucket_analytics_configuration_filter" {
  description = "Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags"
  type        = list(object({
    prefix    = optional(string)
    tags      = optional(map(string))
  }))
  default     = []
}
variable "s3_bucket_analytics_configuration_storage_class_analysis" {
  description = "Analytics data export configuration"
  type        = list(object({
    data_export = list(object({
      output_schema_version = optional(string)
      destination           = list(object({
        s3_bucket_destionation = list(object({
          bucket_arn        = string
          bucket_account_id = optional(string)
          format            = optional(string)
          prefix            = optional(string) 
        }))
      }))
    }))
  }))
  default     =  []
}
