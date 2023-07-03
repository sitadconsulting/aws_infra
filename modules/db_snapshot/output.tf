output "db_snapshot_allocated_storage" {
  description = "Specifies the allocated storage size in gigabytes (GB)"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.allocated_storage, [""]), 0)
}
output "db_snapshot_availability_zone" {
  description = "Specifies the name of the Availability Zone the DB instance was located in at the time of the DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.availability_zone, [""]), 0)
}
output "db_snapshot_db_snapshot_arn" {
  description = "ARN of the DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.db_snapshot_arn, [""]), 0)
}
output "db_snapshot_encrypted" {
  description = "Specifies whether the DB snapshot is encrypted"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.encrypted, [""]), 0)
}
output "db_snapshot_engine" {
  description = "Specifies the name of the database engine"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.engine, [""]), 0)
}
output "db_snapshot_engine_version" {
  description = "Specifies the version of the database engine"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.engine_version, [""]), 0)
}
output "db_snapshot_iops" {
  description = "Specifies the Provisioned IOPS (I/O operations per second) value of the DB instance at the time of the snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.iops, [""]), 0)
}
output "db_snapshot_kms_key_id" {
  description = "ARN for the KMS encryption key"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.kms_key_id, [""]), 0)
}
output "db_snapshot_license_model" {
  description = "License model information for the restored DB instance"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.license_model, [""]), 0)
}
output "db_snapshot_option_group_name" {
  description = "Provides the option group name for the DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.option_group_name, [""]), 0)
}
output "db_snapshot_source_db_snapshot_identifier" {
  description = "The DB snapshot Arn that the DB snapshot was copied from. It only has value in case of cross customer or cross region copy"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.source_db_snapshot_identifier, [""]), 0)
}
output "db_snapshot_source_region" {
  description = "The region that the DB snapshot was created in or copied from"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.source_region, [""]), 0)
}
output "db_snapshot_status" {
  description = "Specifies the status of this DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.status, [""]), 0)
}
output "db_snapshot_storage_type" {
  description = "Specifies the storage type associated with DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.storage_type, [""]), 0)
}
output "db_snapshot_vpc_id" {
  description = "Provides the VPC ID associated with the DB snapshot"
  value       = element(concat(aws_db_snapshot.db_snapshot.*.vpc_id, [""]), 0)
}

