output "docdb_cluster_snapshot_availability_zones" {
  description = "List of EC2 Availability Zones that instances in the DocumentDB cluster snapshot can be restored in"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.availability_zones, [""]), 0)
}
output "docdb_cluster_snapshot_db_cluster_snapshot_arn" {
  description = "ARN for the DocumentDB Cluster Snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.db_cluster_snapshot_arn, [""]), 0)
}
output "docdb_cluster_snapshot_engine" {
  description = "Specifies the name of the database engine"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.engine, [""]), 0)
}
output "docdb_cluster_snapshot_engine_version" {
  description = "Version of the database engine for this DocumentDB cluster snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.engine_version, [""]), 0)
}
output "docdb_cluster_snapshot_kms_key_id" {
  description = "If storage_encrypted is true, the AWS KMS key identifier for the encrypted DocumentDB cluster snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.kms_key_id, [""]), 0)
}
output "docdb_cluster_snapshot_port" {
  description = "Port that the DocumentDB cluster was listening on at the time of the snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.port, [""]), 0)
}
output "docdb_cluster_snapshot_source_db_cluster_snapshot_identifier" {
  description = "The DocumentDB Cluster Snapshot ARN that the DocumentDB Cluster Snapshot was copied from. It only has value in case of cross customer or cross region copy"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.source_db_cluster_snapshot_identifier, [""]), 0)
}
output "docdb_cluster_snapshot_storage_encrypted" {
  description = "Specifies whether the DocumentDB cluster snapshot is encrypted"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.storage_encrypted, [""]), 0)
}
output "docdb_cluster_snapshot_status" {
  description = "The status of this DocumentDB Cluster Snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.status, [""]), 0)
}
output "docdb_cluster_snapshot_vp_id" {
  description = "The VPC ID associated with the DocumentDB cluster snapshot"
  value       = element(concat(aws_docdb_cluster_snapshot.docdb_cluster_snapshot.*.vpc_id, [""]), 0)
}
