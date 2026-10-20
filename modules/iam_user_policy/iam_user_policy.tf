resource "aws_iam_user_policy" "iam_user_policy" {
  policy      = var.iam_user_policy_policy
  name        = var.iam_user_policy_name
  name_prefix = var.iam_user_policy_name_prefix
  user        = var.iam_user_policy_user
}

