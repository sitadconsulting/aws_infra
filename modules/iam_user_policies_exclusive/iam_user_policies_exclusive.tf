resource "aws_iam_user_policies_exclusive" "iam_user_policies_exclusive" {
  user_name    = var.iam_user_policies_exclusive_user_name
  policy_names = var.iam_user_policies_exclusive_policy_names
}
