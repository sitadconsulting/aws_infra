output "iam_user_policy_id" {
  description = "The user policy ID"
  value       = element(concat(aws_iam_user_policy.iam_user_policy.*.id, [""]), 0)
}
output "iam_user_policy_name" {
  description = "The name of the policy"
  value       = element(concat(aws_iam_user_policy.iam_user_policy.*.name, [""]), 0)
}
