output "ebs_snapshot_arn" {
  description = "ARN of the EBS Snapshot"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.arn, [""]), 0)
}
output "ebs_snapshot_id" {
  description = "The snapshot ID (e.g., snap-59fcb34e)"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.id, [""]), 0)
}
output "ebs_snapshot_owner_id" {
  description = "The AWS account ID of the EBS snapshot owner"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.owner_id, [""]), 0)
}
output "ebs_snapshot_owner_alias" {
  description = "Value from an Amazon-maintained list (amazon, aws-marketplace, microsoft) of snapshot owners"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.owner_alias, [""]), 0)
}
output "ebs_snapshot_encrypted" {
  description = "Whether the snapshot is encrypted"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.encrypted, [""]), 0)
}
output "ebs_snapshot_volume_size" {
  description = "The size of the drive in GiBs"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.volume_size, [""]), 0)
}
output "ebs_snapshot_kms_key_id" {
  description = "The ARN for the KMS encryption key"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.kms_key_id, [""]), 0)
}
output "ebs_snapshot_data_encryption_key_id" {
  description = "The data encryption key identifier for the snapshot"
  value       = element(concat(aws_ebs_snapshot.ebs_snapshot.*.data_encryption_key_id, [""]), 0)
}
