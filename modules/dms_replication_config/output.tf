output "dms_replication_config_arn" {
  description = "ARN for the serverless replication config"
  value       = element(concat(aws_dms_replication_config.dms_replication_config.*.arn, [""]), 0)
}
