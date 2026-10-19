resource "aws_iam_group_policies_exclusive" "iam_group_policies_exclusive" {
  group_name   = var.iam_group_policies_exclusive_group_name
  policy_names = var.iam_group_policies_exclusive_policy_names
}
