resource "aws_iam_group_policy" "iam_group_policy" {
  group        = var.iam_group_policy_group
  name         = var.iam_group_policy_name
  name_prefix  = var.iam_group_policy_name_prefix
  policy       = var.iam_group_policy_policy
}
