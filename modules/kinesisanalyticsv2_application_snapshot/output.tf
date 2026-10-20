output "kinesisanalyticsv2_application_snapshot_id" {
  description = "Application snapshot identifier"
  value       = element(concat(aws_kinesisanalyticsv2_application_snapshot.kinesisanalyticsv2_application_snapshot.*.id, [""]), 0)
}
output "kinesisanalyticsv2_application_snapshot_application_version_id" {
  description = "Current application version ID when the snapshot was created"
  value       = element(concat(aws_kinesisanalyticsv2_application_snapshot.kinesisanalyticsv2_application_snapshot.*.application_version_id, [""]), 0)
}
output "kinesisanalyticsv2_application_snapshot_snapshot_creation_timestamp" {
  description = "Timestamp of the application snapshot"
  value       = element(concat(aws_kinesisanalyticsv2_application_snapshot.kinesisanalyticsv2_application_snapshot.*.snapshot_creation_timestamp, [""]), 0)
}
