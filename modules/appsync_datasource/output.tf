output "appsync_datasource_arn" {
  description = "ARN of DataSource"
  value       = element(concat(aws_appsync_datasource.appsync_datasource.*.arn, [""]), 0)
}
