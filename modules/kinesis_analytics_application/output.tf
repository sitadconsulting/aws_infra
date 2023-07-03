output "kinesis_analytics_application_id" {
  description = "ARN of the Kinesis Analytics Application"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.id, [""]), 0)
}
output "kinesis_analytics_application_arn" {
  description = "ARN of the Kinesis Analytics Application"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.arn, [""]), 0)
}
output "kinesis_analytics_application_create_timestamp" {
  description = "Timestamp when the application version was created"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.create_timestamp, [""]), 0)
}
output "kinesis_analytics_application_last_update_timestamp" {
  description = "Timestamp when the application was last updated"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.last_update_timestamp, [""]), 0)
}
output "kinesis_analytics_application_status" {
  description = "Status of the application"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.status, [""]), 0)
}
output "kinesis_analytics_application_version" {
  description = "Version of the application"
  value       = element(concat(aws_kinesis_analytics_application.kinesis_analytics_application.*.version, [""]), 0)
}
