output "mskconnect_worker_configuration_arn" {
  description = "ARN of the worker configuration"
  value       = element(concat(aws_mskconnect_worker_configuration.mskconnect_worker_configuration.*.arn, [""]), 0)
}
output "mskconnect_worker_configuration_latest_revision" {
  description = "ID of the latest successfully created revision of the worker configuration"
  value       = element(concat(aws_mskconnect_worker_configuration.mskconnect_worker_configuration.*.latest_revision, [""]), 0)
}
