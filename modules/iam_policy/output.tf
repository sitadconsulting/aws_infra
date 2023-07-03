output "iam_policy_id" {
  description = "ARN assigned by AWS to this policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.id, [""]), 0)
}
output "iam_policy_arn" {
  description = "ARN assigned by AWS to this policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.arn, [""]), 0)
}
output "iam_policy_description" {
  description = "The description of the policy"
  value       = element(concat(aws_iam_policy.iam_policy.*.description, [""]), 0)
}
output "iam_policy_name" {
  description = "The name of the policy."
  value       = element(concat(aws_iam_policy.iam_policy.*.name, [""]), 0)
}
output "iam_policy_path" {
  description = "The path of the policy in IAM"
  value       = element(concat(aws_iam_policy.iam_policy.*.path, [""]), 0)
}
output "iam_policy_policy" {
  description = "The policy document"
  value       = element(concat(aws_iam_policy.iam_policy.*.policy, [""]), 0)
}
output "iam_policy_policy_id" {
  description = "The policy's ID"
  value       = element(concat(aws_iam_policy.iam_policy.*.policy_id, [""]), 0)
}
