output "redshift_snapshot_schedule_arn" {
  description = "ARN of the Redshift Snapshot Schedule"
  value       = element(concat(aws_redshift_snapshot_schedule.redshift_snapshot_schedule.*.arn, [""]), 0)
}
