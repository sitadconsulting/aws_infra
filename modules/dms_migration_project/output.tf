output "dms_migration_project_arn" {
  description = "ARN of the migration project"
  value       = element(concat(aws_dms_migration_project.dms_migration_project.*.arn, [""]), 0)
}
output "dms_migration_project_creation_time" {
  description = "Time the migration project was created, in RFC3339 format"
  value       = element(concat(aws_dms_migration_project.dms_migration_project.*.creation_time, [""]), 0)
}
output "dms_migration_project_instance_profile_name" {
  description = "Name of the associated instance profile"
  value       = element(concat(aws_dms_migration_project.dms_migration_project.*.instance_profile_name, [""]), 0)
}
output "dms_migration_project_source_data_provider_descriptor_data_provider_name" {
  description = "Name of the source data provider"
  value       = element(concat(aws_dms_migration_project.dms_migration_project.source_data_provider_descriptor.*.data_provider_name, [""]), 0)
}
output "dms_migration_project_target_data_provider_descriptor_data_provider_name" {
  description = "Name of the target data provider"
  value       = element(concat(aws_dms_migration_project.dms_migration_project.target_data_provider_descriptor.*.data_provider_name, [""]), 0)
}
