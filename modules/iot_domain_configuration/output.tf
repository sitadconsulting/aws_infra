output "iot_domain_configuration_arn" {
  description = "The ARN of the domain configuration"
  value       = element(concat(aws_iot_domain_configuration.iot_domain_configuration.*.arn, [""]), 0)
}
output "iot_domain_configuration_domain_type" {
  description = "The type of the domain"
  value       = element(concat(aws_iot_domain_configuration.iot_domain_configuration.*.domain_type, [""]), 0)
}
output "iot_domain_configuration_id" {
  description = "The name of the created domain configuration"
  value       = element(concat(aws_iot_domain_configuration.iot_domain_configuration.*.id, [""]), 0)
}
