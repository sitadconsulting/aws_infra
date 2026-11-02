output "observabilityadmin_s3_table_integration_arn" {
  description = "ARN of the S3 Table integration"
  value       = element(concat(aws_observabilityadmin_s3_table_integration.observabilityadmin_s3_table_integration.*.arn, [""]), 0)
}
output "observabilityadmin_s3_table_integration_destination_table_bucket_arn" {
  description = "ARN of the S3 Table bucket where CloudWatch data is stored. AWS automatically creates a bucket named _aws-cloudwatch_ if one does not already exist"
  value       = element(concat(aws_observabilityadmin_s3_table_integration.observabilityadmin_s3_table_integration.*.destination_table_bucket_arn, [""]), 0)
}
