output "ssoadmin_application_assignment_id" {
  description = "A comma-delimited string concatenating application_arn, principal_id, and principal_type"
  value       = element(concat(aws_ssoadmin_application_assignment.ssoadmin_application_assignment.*.id, [""]), 0)
}
