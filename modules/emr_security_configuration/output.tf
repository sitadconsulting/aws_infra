output "emr_security_configuration_id" {
  description = "The ID of the EMR Security Configuration (Same as the name)"
  value       = element(concat(aws_emr_security_configuration.emr_security_configuration.*.id, [""]), 0)
}
output "emr_security_configuration_name" {
  description = "The Name of the EMR Security Configuration"
  value       = element(concat(aws_emr_security_configuration.emr_security_configuration.*.name, [""]), 0)
}
output "emr_security_configuration_configuration" {
  description = " The JSON formatted Security Configuration"
  value       = element(concat(aws_emr_security_configuration.emr_security_configuration.*.configuration, [""]), 0)
}
output "emr_security_configuration_creation_date" {
  description = "Date the Security Configuration was created"
  value       = element(concat(aws_emr_security_configuration.emr_security_configuration.*.creation_date, [""]), 0)
}
