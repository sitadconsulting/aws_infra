resource "aws_iam_role_policy" "iam_role_policy" {
  name        = var.iam_role_policy_name
  name_prefix = var.iam_role_policy_name_prefix
  policy      = var.iam_role_policy_policy
  role        = var.iam_role_policy_role
}
