variable "s3_bucket_lifecycle_configuration_bucket" {
  description = "Name of the source S3 bucket you want Amazon S3 to monitor"
  type        = string
}
variable "s3_bucket_lifecycle_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_lifecycle_configuration_rule" {
  description = "Replication management rules configuration"
  type        = list(object({
    id     = string
    status = string
    abort_incomplete_multipart_upload = optional(list(object({
      days_after_initiation       = optional(number)      
    })), [])
    expiration                        = optional(list(object({
      date                         = optional(string)
      days                         = optional(number)
      expired_object_delete_marker = optional(bool)
    })), [])
    filter                            = optional(list(object({
      object_size_greater_than     = optional(number)
      object_size_less_than        = optional(number)
      prefix                       = optional(string)
      and                             = optional(list(object({
        object_size_greater_than   = optional(number)
        object_size_less_than      = optional(number)
        prefix                     = optional(string)
      })), [])
      tag                             = optional(list(object({
        key   = string
        value = string
      })), []) 
    })), [])
    noncurrent_version_expiration     = optional(list(object({
      newer_noncurrent_versions    = optional(number)
      noncurrent_days              = optional(number)
    })), [])
    noncurrent_version_transition     = optional(list(object({
      newer_noncurrent_versions    = optional(number)
      noncurrent_days              = optional(number)
      storage_class                = string
    })), [])
    transition                        = optional(list(object({
      date                         = optional(string)
      days                         = optional(number)
      storage_class                = string
    })), [])
  }))
  default     = []
}
