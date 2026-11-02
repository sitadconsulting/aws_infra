variable "observabilityadmin_s3_table_integration_role_arn" {
  description = "(Required, Forces new resource) ARN of the IAM role that grants the S3 Table integration permissions to access necessary resources"
  type        = string
}
variable "observabilityadmin_s3_table_integration_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "observabilityadmin_s3_table_integration_encryption" {
  description = "(Required, Forces new resource) Encryption configuration block"
  type        = list(object({
    kms_key_arn   = optional(string)
    sse_algorithm = string
  }))
}
