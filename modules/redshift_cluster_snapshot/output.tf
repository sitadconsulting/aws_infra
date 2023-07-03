output "redshift_cluster_snapshot_arn" {
  description = "ARN of snapshot"
  value       = element(concat(aws_redshift_cluster_snapshot.redshift_cluster_snapshot.*.arn, [""]), 0)
}
output "redshift_cluster_snapshot_id" {
  description = "A unique identifier for the snapshot that you are requesting"
  value       = element(concat(aws_redshift_cluster_snapshot.redshift_cluster_snapshot.*.id, [""]), 0)
}
output "redshift_cluster_snapshot_kms_key_id" {
  description = "The Key Management Service (KMS) key ID of the encryption key that was used to encrypt data in the cluster from which the snapshot was taken"
  value       = element(concat(aws_redshift_cluster_snapshot.redshift_cluster_snapshot.*.kms_key_id, [""]), 0)
}
output "redshift_cluster_snapshot_owner_account" {
  description = "For manual snapshots, the Amazon Web Services account used to create or copy the snapshot. For automatic snapshots, the owner of the cluster"
  value       = element(concat(aws_redshift_cluster_snapshot.redshift_cluster_snapshot.*.owner_account, [""]), 0)
}
