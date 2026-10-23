output "ebs_snapshot_import_arn" {
  description = "ARN of the EBS Snapshot"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.arn, [""]), 0)
}
output "ebs_snapshot_import_id" {
  description = "The snapshot ID (e.g., snap-59fcb34e)"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.id, [""]), 0)
}
output "ebs_snapshot_import_owner_id" {
  description = "The AWS account ID of the EBS snapshot owner"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.owner_id, [""]), 0)
}
output "ebs_snapshot_import_owner_alias" {
  description = "Value from an Amazon-maintained list (amazon, aws-marketplace, microsoft) of snapshot owners"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.owner_alias, [""]), 0)
}
output "ebs_snapshot_import_volume_size" {
  description = "The size of the drive in GiBs"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.volume_size, [""]), 0)
}
output "ebs_snapshot_import_data_encryption_key_id" {
  description = "The data encryption key identifier for the snapshot"
  value       = element(concat(aws_ebs_snapshot_import.ebs_snapshot_import.*.data_encryption_key_id, [""]), 0)
}
