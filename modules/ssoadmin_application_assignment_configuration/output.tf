output "ssoadmin_application_assignment_configuration_id" {
  description = "Application ARN"
  value       = element(concat(aws_ssoadmin_application_assignment_configuration.ssoadmin_application_assignment_configuration.*.id, [""]), 0)
}
