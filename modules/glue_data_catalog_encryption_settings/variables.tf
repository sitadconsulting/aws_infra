variable "glue_data_catalog_encryption_settings_catalog_id" {
  description = "The ID of the Data Catalog to set the security configuration for. If none is provided, the AWS account ID is used by default"
  type        = string
  default     = ""
} 
variable "glue_data_catalog_encryption_settings_data_catalog_encryption_settings" {
  description = "The security configuration to set"
  type        = list(object({
    connection_password_encryption = list(object({
      aws_kms_key_id                       = optional(string)
      return_connection_password_encrypted = bool
    }))
    encryption_at_rest             = list(object({
      catalog_encryption_mode = string
      sse_aws_kms_key_id      = optional(string)
    }))
  }))
  default     = []
}
