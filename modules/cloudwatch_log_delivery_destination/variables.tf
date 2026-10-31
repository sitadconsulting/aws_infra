variable "cloudwatch_log_delivery_destination_delivery_destination_type" {
  description = "(Optional) The type of delivery destination. Valid values: S3, CWL, FH, XRAY. Required for X-Ray trace delivery destinations. For other destination types, this is computed from the destination_resource_arn"
  type        = string
  default     = null
}
variable "cloudwatch_log_delivery_destination_name" {
  description = "(Required) The name for this delivery destination"
  type        = string
}
variable "cloudwatch_log_delivery_destination_output_format" {
  description = "(Optional) The format of the logs that are sent to this delivery destination. Valid values: json, plain, w3c, raw, parquet"
  type        = string
  default     = null
}
variable "cloudwatch_log_delivery_destination_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_log_delivery_destination_delivery_destination_configuration" {
  description = " (Optional) The AWS resource that will receive the logs. Required for CloudWatch Logs, Amazon S3, and Firehose destinations. Not required for X-Ray trace delivery destinations"
  type        = list(object({
    destination_resource_arn = optional(string) 
  }))
  default     = []
}
