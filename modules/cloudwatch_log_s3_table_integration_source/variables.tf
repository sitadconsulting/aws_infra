variable "cloudwatch_log_s3_table_integration_source_integration_arn" {
  description = "(Required, Forces new resource) ARN of the aws_observabilityadmin_s3_table_integration to associate the data source with"
  type        = string
}
variable "cloudwatch_log_s3_table_integration_source_data_source" {
  description = "(Required, Forces new resource) Data source to associate with the S3 Table Integration"
  type        = list(object({
    name = string
    type = string
  }))
}
