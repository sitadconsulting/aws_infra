output "dms_data_provider_arn" {
  description = "ARN of the data provider"
  value       = element(concat(aws_dms_data_provider.dms_data_provider.*.arn, [""]), 0)
}
output "dms_data_provider_creation_time" {
  description = "Creation time of the data provider in RFC3339 format"
  value       = element(concat(aws_dms_data_provider.dms_data_provider.*.creation_time, [""]), 0)
}
