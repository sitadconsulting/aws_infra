output "ssoadmin_account_assignment_id" {
  description = "The identifier of the Account Assignment i.e., principal_id, principal_type, target_id, target_type, permission_set_arn, instance_arn separated by commas (,)"
  value       = element(concat(aws_ssoadmin_account_assignment.ssoadmin_account_assignment.*.id, [""]), 0)
}
