output "rds_cluster_instance_arn" {
  description = "ARN of cluster instance"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.arn, [""]), 0)
}
output "rds_cluster_instance_cluster_identifier" {
  description = "RDS Cluster Identifier"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.cluster_identifier, [""]), 0)
}
output "rds_cluster_instance_identifier" {
  description = "Instance identifier"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.identifier, [""]), 0)
}
output "rds_cluster_instance_id" {
  description = "Instance identifier"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.id, [""]), 0)
}
output "rds_cluster_instance_writer" {
  description = "Whether instance is writable. False indicates this instance is a read replica"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.writer, [""]), 0)
}
output "rds_cluster_instance_availability_zone" {
  description = "Availability zone of the instance"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.availability_zone, [""]), 0)
}
output "rds_cluster_instance_endpoint" {
  description = "The DNS address for this instance. May not be writable"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.endpoint, [""]), 0)
}
output "rds_cluster_instance_engine" {
  description = "Database engine"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.engine, [""]), 0)
}
output "rds_cluster_instance_engine_version_actual" {
  description = "Database engine version"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.engine_version_actual, [""]), 0)
}
output "rds_cluster_instance_port" {
  description = "Database port"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.port, [""]), 0)
}
output "rds_cluster_instance_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.storage_encrypted, [""]), 0)
}
output "rds_cluster_instance_kms_key_id" {
  description = "ARN of this KMS encryption key if one is set to the cluster."
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.kms_key_id, [""]), 0)
}
output "rds_cluster_instance_network_type" {
  description = "Network type of the DB instance"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.network_type, [""]), 0)
}
output "rds_cluster_instance_dbi_resource_id" {
  description = "Region-unique, immutable identifier for the DB instance."
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.dbi_resource_id, [""]), 0)
}
output "rds_cluster_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.performance_insights_enabled, [""]), 0)
}
output "rds_cluster_instance_performance_insights_kms_key_id" {
  description = "ARN of the KMS encryption key used by Performance Insights"
  value       = element(concat(aws_rds_cluster_instance.rds_cluster_instance.*.performance_insights_kms_key_id, [""]), 0)
}
