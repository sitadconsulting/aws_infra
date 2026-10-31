variable "cloudwatch_log_delivery_delivery_destination_arn" {
  description = "(Required) The ARN of the delivery destination to use for this delivery"
  type        = string
}
variable "cloudwatch_log_delivery_delivery_source_name" {
  description = "(Required) The name of the delivery source to use for this delivery"
  type        = string
}
variable "cloudwatch_log_delivery_field_delimiter" {
  description = "(Optional) The field delimiter to use between record fields when the final output format of a delivery is in plain, w3c, or raw format"
  type        = string
  default     = null
}
variable "cloudwatch_log_delivery_record_fields" {
  description = "(Optional) The list of record fields to be delivered to the destination, in order. The valid field names vary by the log_type of the delivery source. For a CloudFront ACCESS_LOGS"
  type        = list(string)
  default     = null
}
variable "cloudwatch_log_delivery_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_log_delivery_s3_delivery_configuration" {
  description = "(Optional) Parameters that are valid only when the delivery's delivery destination is an S3 bucket"
  type        = list(object({
    enable_hive_compatible_path = optional(bool)
    suffix_path                 = optional(string)
  }))
  default     = []
}
