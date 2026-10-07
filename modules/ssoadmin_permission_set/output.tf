output "ssoadmin_permission_set_arn" {
  description = "ARN of the Permission Set"
  value       = element(concat(aws_ssoadmin_permission_set.ssoadmin_permission_set.*.arn, [""]), 0)
}
output "ssoadmin_permission_set_id" {
  description = "ARN of the Permission Set and SSO Instance, separated by a comma (,)"
  value       = element(concat(aws_ssoadmin_permission_set.ssoadmin_permission_set.*.id, [""]), 0)
}
output "ssoadmin_permission_set_created_date" {
  description = "The date the Permission Set was created in RFC3339 format"
  value       = element(concat(aws_ssoadmin_permission_set.ssoadmin_permission_set.*.created_date, [""]), 0)
}
