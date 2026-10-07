output "ssoadmin_application_access_scope_id" {
  description = "A comma-delimited string concatenating application_arn and scope"
  value       = element(concat(aws_ssoadmin_application_access_scope.ssoadmin_application_access_scope.*.id, [""]), 0)
}
