variable "glue_security_configuration_name" {
  description = "Name of the security configuration"
  type        = string
}
variable "glue_security_configuration_encryption_configuration" {
  description = "encryption configuration"
  type        = list(object({
    cloudwatch_encryption = list(object({
      cloudwatch_encryption_mode = optional(string)
      kms_key_arn                = optional(string)
    }))
    job_bookmarks_encryption = list(object({
      job_bookmarks_encryption_mode = optional(string)
      kms_key_arn                   = optional(string)
    }))
    s3_encryption = list(object({
      kms_key_arn        = optional(string)
      s3_encryption_mode = optional(string)
    }))
  }))
}
