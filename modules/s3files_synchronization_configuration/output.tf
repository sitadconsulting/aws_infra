output "s3files_synchronization_configuration_version_number" {
  description = "Latest synchronization configuration version number"
  value       = element(concat(aws_s3files_synchronization_configuration.s3files_synchronization_configuration.*.latest_version_number, [""]), 0)
}
