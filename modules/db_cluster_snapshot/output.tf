output "db_cluster_snapshot_allocated_storage" {
  description = "Allocated storage size in gigabytes (GB)"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.allocated_storage, [""]), 0)
}
output "db_cluster_snapshot_availability_zones" {
  description = "List of EC2 Availability Zones that instances in the DB cluster snapshot can be restored in"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.availability_zones, [""]), 0)
}
output "db_cluster_snapshot_arn" {
  description = "The Amazon Resource Name (ARN) for the DB Cluster Snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.db_cluster_snapshot_arn, [""]), 0)
}
output "db_cluster_snapshot_engine" {
  description = "Name of the database engine"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.engine, [""]), 0)
}
output "db_cluster_snapshot_engine_version" {
  description = "Version of the database engine for this DB cluster snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.engine_version, [""]), 0)
}
output "db_cluster_snapshot_kms_key_id" {
  description = "If storage_encrypted is true, the AWS KMS key identifier for the encrypted DB cluster snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.kms_key_id, [""]), 0)
}
output "db_cluster_snapshot_license_model" {
  description = "License model information for the restored DB cluster"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.license_model, [""]), 0)
}
output "db_cluster_snapshot_port" {
  description = "Port that the DB cluster was listening on at the time of the snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.port, [""]), 0)
}
output "db_cluster_snapshot_source_db_cluster_snapshot_identifier" {
  description = "DB Cluster Snapshot ARN that the DB Cluster Snapshot was copied from. It only has value in case of cross customer or cross region copy"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.source_db_cluster_snapshot_identifier, [""]), 0)
}
output "db_cluster_snapshot_storage_encrypted" {
  description = "Whether the DB cluster snapshot is encrypted"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.storage_encrypted, [""]), 0)
}
output "db_cluster_snapshot_status" {
  description = "The status of this DB Cluster Snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.status, [""]), 0)
}
output "db_cluster_snapshot_vpc_id" {
  description = "The VPC ID associated with the DB cluster snapshot"
  value       = element(concat(aws_db_cluster_snapshot.db_cluster_snapshot.*.vpc_id, [""]), 0)
}
