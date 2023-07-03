output "db_instance_address" {
  description = "The hostname of the RDS instance. See also endpoint and port"
  value       = element(concat(aws_db_instance.db_instance.*.address, [""]), 0)
}
output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = element(concat(aws_db_instance.db_instance.*.arn, [""]), 0)
}
output "db_instance_allocated_storage" {
  description = "The amount of allocated storage"
  value       = element(concat(aws_db_instance.db_instance.*.allocated_storage, [""]), 0)
}
output "db_instance_availability_zone" {
  description = "The availability zone of the instance"
  value       = element(concat(aws_db_instance.db_instance.*.availability_zone, [""]), 0)
}
output "db_instance_backup_retention_period" {
  description = "The backup retention period"
  value       = element(concat(aws_db_instance.db_instance.*.backup_retention_period, [""]), 0)
}
output "db_instance_backup_window" {
  description = "The backup window"
  value       = element(concat(aws_db_instance.db_instance.*.backup_window, [""]), 0)
}
output "db_instance_ca_cert_identifier" {
  description = "Identifier of the CA certificate for the DB instance"
  value       = element(concat(aws_db_instance.db_instance.*.ca_cert_identifier, [""]), 0)
}
output "db_instance_db_name" {
  description = "The database name"
  value       = element(concat(aws_db_instance.db_instance.*.db_name, [""]), 0)
}
output "db_instance_domian" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = element(concat(aws_db_instance.db_instance.*.domain, [""]), 0)
}
output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service"
  value       = element(concat(aws_db_instance.db_instance.*.domian_iam_role_name, [""]), 0)
}
output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format"
  value       = element(concat(aws_db_instance.db_instance.*.endpoint, [""]), 0)
}
output "db_instance_engine" {
  description = "The database engine"
  value       = element(concat(aws_db_instance.db_instance.*.engine, [""]), 0)
}
output "db_instance_engine_version_actual" {
  description = "The running version of the database"
  value       = element(concat(aws_db_instance.db_instance.*.engine_version_actual, [""]), 0)
}
output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = element(concat(aws_db_instance.db_instance.*.hosted_zone_id, [""]), 0)
}
output "db_instance_id" {
  description = "RDS instance ID."
  value       = element(concat(aws_db_instance.db_instance.*.id, [""]), 0)
}
output "db_instance_instance_class" {
  description = "RDS instance class"
  value       = element(concat(aws_db_instance.db_instance.*.instance_class, [""]), 0)
}
output "db_instance_latest_restorable_time" {
  description = "The latest time, in UTC RFC3339 format, to which a database can be restored with point-in-time restore"
  value       = element(concat(aws_db_instance.db_instance.*.latest_restorable_time, [""]), 0)
}
output "db_instance_listener_endpoint" {
  description = "Specifies the listener connection endpoint for SQL Server Always On"
  value       = element(concat(aws_db_instance.db_instance.*.listener_endpoint, [""]), 0)
}
output "db_instance_maintenance_window" {
  description = "The instance maintenance window"
  value       = element(concat(aws_db_instance.db_instance.*.maintenance_window, [""]), 0)
}
output "db_instance_master_user_secret" {
  description = "A block that specifies the master user secret. Only available when manage_master_user_password is set to true"
  value       = element(concat(aws_db_instance.db_instance.*.master_user_secret, [""]), 0)
}
output "db_instance_multi-az" {
  description = "If the RDS instance is multi AZ enabled"
  value       = element(concat(aws_db_instance.db_instance.*.multi-az, [""]), 0)
}
output "db_instance_name" {
  description = "Database name"
  value       = element(concat(aws_db_instance.db_instance.*.name, [""]), 0)
}
output "db_instance_port" {
  description = "Database port"
  value       = element(concat(aws_db_instance.db_instance.*.port, [""]), 0)
}
output "db_instance_address" {
  description = "RDS Resource ID of this instance"
  value       = element(concat(aws_db_instance.db_instance.*.address, [""]), 0)
}
output "db_instance_resource_id" {
  description = "The hostname of the RDS instance. See also endpoint and port"
  value       = element(concat(aws_db_instance.db_instance.*.resource_id, [""]), 0)
}
output "db_instance_status" {
  description = "RDS instance status"
  value       = element(concat(aws_db_instance.db_instance.*.status, [""]), 0)
}
output "db_instance_storage_encrypted" {
  description = "Whether the DB instance is encrypted"
  value       = element(concat(aws_db_instance.db_instance.*.storage_encrypted, [""]), 0)
}
output "db_instance_username" {
  description = "The master username for the database"
  value       = element(concat(aws_db_instance.db_instance.*.username, [""]), 0)
}
output "db_instance_character_set_name" {
  description = "The character set (collation) used on Oracle and Microsoft SQL instances"
  value       = element(concat(aws_db_instance.db_instance.*.character_set_name, [""]), 0)
}
output "db_instance_storage_encrypted" {
  description = "Whether the DB instance is encrypted"
  value       = element(concat(aws_db_instance.db_instance.*.storage_encrypted, [""]), 0)
}
output "db_instance_storage_encrypted" {
  description = "Whether the DB instance is encrypted"
  value       = element(concat(aws_db_instance.db_instance.*.storage_encrypted, [""]), 0)
}
