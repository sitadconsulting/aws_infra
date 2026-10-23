output "snapshot_create_volume_permission_id" {
  description = "A combination of \"snapshot_id-account_id\""
  value       = element(concat(aws_snapshot_create_volume_permission.snapshot_create_volume_permission.*.id, [""]), 0)
}
