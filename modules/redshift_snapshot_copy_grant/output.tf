output "redshift_snapshot_copy_grant_arn" {
  description = "ARN of snapshot copy grant"
  value       = element(concat(aws_redshift_snapshot_copy_grant.redshift_snapshot_copy_grant.*.arn, [""]), 0)
}
