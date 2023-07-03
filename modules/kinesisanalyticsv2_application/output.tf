output "kinesisanalyticsv2_application_id" {
  description = "Application identifier"
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.id, [""]), 0)
}
output "kinesisanalyticsv2_application_arn" {
  description = "ARN of the application"
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.arn, [""]), 0)
}
output "kinesisanalyticsv2_application_create_timestamp" {
  description = "The current timestamp when the application was created"
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.create_timestamp, [""]), 0)
}
output "kinesisanalyticsv2_application_last_update_timestamp" {
  description = "The current timestamp when the application was last updated."
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.last_update_timestamp, [""]), 0)
}
output "kinesisanalyticsv2_application_status" {
  description = "Application status"
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.status, [""]), 0)
}
output "kinesisanalyticsv2_application_version_id" {
  description = "Application current version. Kinesis Data Analytics updates the version_id each time the application is updated"
  value       = element(concat(aws_kinesisanalyticsv2_application.kinesisanalyticsv2_application.*.version_id, [""]), 0)
}
