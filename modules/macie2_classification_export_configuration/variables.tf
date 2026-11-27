variable "macie2_classification_export_configuration_s3_destination" {
  description = "(Required) Configuration block for a S3 Destination"
  type        = list(object({
    bucket_name = string
    key_prefix  = optional(string)
    kms_key_arn = string
  }))
}
