output "ebs_snapshot_copy_arn" {
  description = "ARN of the EBS Snapshot"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.arn, [""]), 0)
}
output "ebs_snapshot_copy_id" {
  description = "The snapshot ID (e.g., snap-59fcb34e)"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.id, [""]), 0)
}
output "ebs_snapshot_copy_owner_id" {
  description = "The AWS account ID of the snapshot owner"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.owner_id, [""]), 0)
}
output "ebs_snapshot_copy_owner_alias" {
  description = "Value from an Amazon-maintained list (amazon, aws-marketplace, microsoft) of snapshot owners"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.owner_alias, [""]), 0)
}
output "ebs_snapshot_copy_volume_size" {
  description = "The size of the drive in GiBs"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.volume_size, [""]), 0)
}
output "ebs_snapshot_copy_data_encryption_key_id" {
  description = "The data encryption key identifier for the snapshot"
  value       = element(concat(aws_ebs_snapshot_copy.ebs_snapshot_copy.*.data_encryption_key_id, [""]), 0)
}
