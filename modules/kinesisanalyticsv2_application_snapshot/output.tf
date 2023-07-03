output "kinesisanalyticsv2_application_snapshot_id" {
  description = "The application snapshot identifier"
  value       = element(concat(aws_kinesisanalyticsv2_application_snapshot.kinesisanalyticsv2_application_snapshot.*.id, [""]), 0)
}
output "kinesisanalyticsv2_application_snapshot_application_version_id" {
  description = "The current application version ID when the snapshot was created"
  value       = element(concat(aws_kinesisanalyticsv2_application_snapshot.kinesisanalyticsv2_application_snapshot.*.application_version_id, [""]), 0)
}
