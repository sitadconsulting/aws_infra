output "rds_cluster_arn" {
  description = "ARN of cluster"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.arn, [""]), 0)
}
output "rds_cluster_id" {
  description = "RDS Cluster Identifier"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.id, [""]), 0)
}
output "rds_cluster_cluster_identifier" {
  description = "RDS Cluster Identifier"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.cluster_identifier, [""]), 0)
}
output "rds_cluster_arn" {
  description = "ARN of cluster"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.arn, [""]), 0)
}
output "rds_cluster_cluster_resource_id" {
  description = "RDS Cluster Resource ID"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.cluster_resource_id, [""]), 0)
}
output "rds_cluster_cluster_members" {
  description = "List of RDS Instances that are a part of this cluster"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.cluster_members, [""]), 0)
}
output "rds_cluster_availability_zones" {
  description = "The availability zone of the instance"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.availability_zones, [""]), 0)
}
output "rds_cluster_backup_retention_period" {
  description = "Backup retention period"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.backup_retention_period, [""]), 0)
}
output "rds_cluster_preferred_backup_window" {
  description = "Daily time range during which the backups happen"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.preferred_backup_window, [""]), 0)
}
output "rds_cluster_preferred_maintenance_window" {
  description = "maintenance window"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.preferred_maintenance_window, [""]), 0)
}
output "rds_cluster_endpoint" {
  description = "DNS address of the RDS instance"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.endpoint, [""]), 0)
}
output "rds_cluster_reader_endpoint" {
  description = "A read-only endpoint for the Aurora cluster, automatically load-balanced across replicas"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.reader_endpoint, [""]), 0)
}
output "rds_cluster_engine" {
  description = "Database engine"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.engine, [""]), 0)
}
output "rds_cluster_engine_version_actual" {
  description = "The running version of the database"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.engine_version_actual, [""]), 0)
}
output "rds_cluster_database_name" {
  description = "The database name"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.database_name, [""]), 0)
}
output "rds_cluster_port" {
  description = "The database port"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.port, [""]), 0)
}
output "rds_cluster_master_username" {
  description = "The master username for the database"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.master_username, [""]), 0)
}
output "rds_cluster_master_user_secret" {
  description = "A block that specifies the master user secret. Only available when manage_master_user_password is set to true"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.master_user_secret, [""]), 0)
}
output "rds_cluster_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.storage_encrypted, [""]), 0)
}
output "rds_cluster_replication_source_identifier" {
  description = "ARN of the source DB cluster or DB instance if this DB cluster is created as a Read Replica"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.replication_source_identifier, [""]), 0)
}
output "rds_cluster_hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = element(concat(aws_rds_cluster.rds_cluster.*.hosted_zone_id, [""]), 0)
}
