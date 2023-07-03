output "iam_group_policy_id" {
  description = "The group policy ID"
  value       = element(concat(aws_iam_group_policy.iam_group_policy.*.id, [""]), 0)
}
output "iam_group_policy_group" {
  description "The group to which this policy applies"
  value       = element(concat(aws_iam_group_policy.iam_group_policy.*.group, [""]), 0)
}
output "iam_group_policy_name" {
  description = "The name of the policy"
  value       = element(concat(aws_iam_group_policy.iam_group_policy.*.name, [""]), 0)
}
output "iam_group_policy_policy" {
  description "The policy document attached to the group"
  value       = element(concat(aws_iam_group_policy.iam_group_policy.*.policy, [""]), 0)
}
