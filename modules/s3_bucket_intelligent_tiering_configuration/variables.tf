variable "s3_bucket_intelligent_tiering_configuration_bucket" {
  description = "Name of the bucket this intelligent tiering configuration is associated with"
  type        = string
}
variable "s3_bucket_intelligent_tiering_configuration_name" {
  description = "Unique name used to identify the S3 Intelligent-Tiering configuration for the bucket"
  type        = string
}
variable "s3_bucket_intelligent_tiering_configuration_status" {
  description = "Specifies the status of the configuration. Valid values: Enabled, Disabled"
  type        = string
  default     = ""
}
variable "s3_bucket_intelligent_tiering_configuration_filter" {
  description = "Bucket filter configuration"
  type        = list(object({
    prefix    = optional(string)
    tags      = optional(map(string))
  }))
  default     = []
}
variable "s3_bucket_intelligent_tiering_configuration_tiering" {
  description = "S3 Intelligent-Tiering storage class tiers configuration"
  type        = list(object({
    access_tier = string
    days        = number
  }))
  default     = []
}
