output "db_instance_automated_backups_replication_id" {
  description = "ARN of the replicated automated backups"
  value       = element(concat(aws_db_instance_automated_backups_replication.db_instance_automated_backups_replication.*.id, [""]), 0)
}
