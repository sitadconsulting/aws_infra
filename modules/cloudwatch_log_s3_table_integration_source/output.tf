output "cloudwatch_log_s3_table_integration_source_id" {
  description = "Unique identifier (UUID) for the association between the data source and S3 Table Integration. To find this value for an existing association created outside Terraform, run aws logs list-sources-for-s3-table-integration --integration-arn <ARN> and use the Identifier field from the response"
  value       = element(concat(aws_cloudwatch_log_s3_table_integration_source.cloudwatch_log_s3_table_integration_source.*.id, [""]), 0)
}
