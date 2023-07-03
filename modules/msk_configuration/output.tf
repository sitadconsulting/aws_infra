output "msk_configuration_arn" {
  description = "ARN of the configuration"
  value       = element(concat(aws_msk_configuration.msk_configuration.*.arn, [""]), 0)
}
output "msk_configuration_latest_revision" {
  description = "Latest revision of the configuration"
  value       = element(concat(aws_msk_configuration.msk_configuration.*.latest_revision, [""]), 0)
}
