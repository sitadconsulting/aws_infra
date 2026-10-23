output "ebs_fast_snapshot_restore_id" {
  description = "A comma-delimited string concatenating availability_zone and snapshot_id"
  value       = element(concat(aws_ebs_fast_snapshot_restore.ebs_fast_snapshot_restore.*.id, [""]), 0)
}
output "ebs_fast_snapshot_restore_state" {
  description = "State of fast snapshot restores. Valid values are enabling, optimizing, enabled, disabling, disabled"
  value       = element(concat(aws_ebs_fast_snapshot_restore.ebs_fast_snapshot_restore.*.state, [""]), 0)
}
