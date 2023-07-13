variable "s3_bucket_inventory_bucket" {
  description = "Name of the source bucket that inventory lists the objects for"
  type        = string
}
variable "s3_bucket_inventory_enabled" {
  description = "Specifies whether the inventory is enabled or disabled. Default: true"
  type        = bool
  default     = false
}
variable "s3_bucket_inventory_included_object_versions" {
  description = "Object versions to include in the inventory list. Valid values: All, Current"
  type        = string
}
variable "s3_bucket_inventory_name" {
  description = "Unique identifier of the inventory configuration for the bucket"
  type        = string
}
variable "s3_bucket_inventory_optional_fields" {
  description = "List of optional fields that are included in the inventory results"
  type        = list(string)
  default     = []
}
variable "s3_bucket_inventory_destination" {
  description = "Configuration of where to publish the inventory results"
  type        = list(object({
    bucket    = list(object({
      account_id = optional(string)
      bucket_arn = string
      format     = string
      prefix     = optional(string)
      encryption = optional(list(object({
        sse_s3   = optional(list(string))
        sse_kms  = optional(list(object({
          key_id = string
        })), [])
      })), [])
    }))
  }))
  default     = []
}
variable "s3_bucket_inventory_filter" {
  description = "Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria"
  type        = list(object({
    prefix    = optional(string)
  }))
  default     = []
}
variable "s3_bucket_inventory_schedule" {
  description = "Specifies the schedule for generating inventory results"
  type        = list(object({
    frequency = string
  })) 
  default     = []
}
