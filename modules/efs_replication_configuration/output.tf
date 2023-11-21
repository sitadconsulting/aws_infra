output "efs_replication_configuration_creation_time" {
  description = "When the replication configuration was created"
  value       = element(concat(aws_efs_replication_configuration.efs_replication_configuration.*.creation_time, [""]), 0)
}
output "efs_replication_configuration_original_source_file_system_arn" {
  description = "ARN of the original source Amazon EFS file system in the replication configuration"
  value       = element(concat(aws_efs_replication_configuration.efs_replication_configuration.*.original_source_file_system_arn, [""]), 0)
}
output "efs_replication_configuration_source_file_system_arn" {
  description = "ARN of the current source file system in the replication configuration"
  value       = element(concat(aws_efs_replication_configuration.efs_replication_configuration.*.source_file_system_arn, [""]), 0)
}
output "efs_replication_configuration_source_file_system_region" {
  description = "The AWS Region in which the source Amazon EFS file system is located"
  value       = element(concat(aws_efs_replication_configuration.efs_replication_configuration.*.source_file_system_region, [""]), 0)
}
output "efs_replication_configuration_destination" {
  description = "Destinations filesystem config"
  value       = element(concat(aws_efs_replication_configuration.efs_replication_configuration.*.destination, [""]), 0)
}
