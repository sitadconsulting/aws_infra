output "docdb_cluster_instance_arn" {
  description = "ARN of cluster instance"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.arn, [""]), 0)
}
output "docdb_cluster_instance_db_subnet_group_name" {
  description = "DB subnet group to associate with this DB instance"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.db_subnet_group_name, [""]), 0)
}
output "docdb_cluster_instance_dbi_resource_id" {
  description = "Region-unique, immutable identifier for the DB instance"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.dbi_resource_id, [""]), 0)
}
output "docdb_cluster_instance_endpoint" {
  description = "DNS address for this instance. May not be writable"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.endpoint, [""]), 0)
}
output "docdb_cluster_instance_engine_version" {
  description = "Database engine version"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.engine_version, [""]), 0)
}
output "docdb_cluster_instance_kms_key_id" {
  description = "ARN for the KMS encryption key if one is set to the cluster"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.kms_key_id, [""]), 0)
}
output "docdb_cluster_instance_port" {
  description = "Database port"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.port, [""]), 0)
}
output "docdb_cluster_instance_preferred_backup_window" {
  description = "Daily time range during which automated backups are created if automated backups are enabled"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.preferred_backup_window, [""]), 0)
}
output "docdb_cluster_instance_storage_encrypted" {
  description = "Whether the DB cluster is encrypted"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.storage_encrypted, [""]), 0)
}
output "docdb_cluster_instance_writer" {
  description = "Whether this instance is writable. False indicates this instance is a read replica"
  value       = element(concat(aws_docdb_cluster_instance.docdb_cluster_instance.*.writer, [""]), 0)
}
