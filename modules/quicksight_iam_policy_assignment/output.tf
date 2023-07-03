output "quicksight_iam_policy_assignment_assignment_id" {
  description = "Assignment ID"
  value       = element(concat(aws_quicksight_iam_policy_assignment.quicksight_iam_policy_assignment.*.assignment_id, [""]), 0)
}
output "quicksight_iam_policy_assignment_id" {
  description = "A comma-delimited string joining AWS account ID, namespace, and assignment name"
  value       = element(concat(aws_quicksight_iam_policy_assignment.quicksight_iam_policy_assignment.*.id, [""]), 0)
}
