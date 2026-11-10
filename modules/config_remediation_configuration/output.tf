output "config_remediation_configuration_arn" {
  description = "ARN of the Config Remediation Configuration"
  value       = element(concat(aws_config_remediation_configuration.config_remediation_configuration.*.arn, [""]), 0)
}
