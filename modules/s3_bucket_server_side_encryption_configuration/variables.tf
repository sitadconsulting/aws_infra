variable "s3_bucket_server_side_encryption_configuration_bucket" {
  description = "ID (name) of the bucket"
  type        = string
}
variable "s3_bucket_server_side_encryption_configuration_expected_bucket_owner" {
  description = "Account ID of the expected bucket owner"
  type        = string
  default     = ""
}
variable "s3_bucket_server_side_encryption_configuration_rule" {
  description = "Set of server-side encryption configuration rules"
  type        = list(object({
    bucket_key_enabled = optional(bool)
    apply_server_side_encryption_by_default = optional(list(object({
      kms_master_key_id = optional(string)
      sse_algorithm     = string
    })))
  }))
  default     = []
}
