output "iam_group_membership_name" {
  description = "The name to identify the Group Membership"
  value       = element(concat(aws_iam_group_membership.iam_group_membership.*.name, [""]), 0)
}
output "iam_group_membership_users" {
  description = "list of IAM User names"
  value       = element(concat(aws_iam_group_membership.iam_group_membership.*.users, [""]), 0)
}
output "iam_group_membership_group" {
  description = "IAM Group name"
  value       = element(concat(aws_iam_group_membership.iam_group_membership.*.group, [""]), 0)
}

