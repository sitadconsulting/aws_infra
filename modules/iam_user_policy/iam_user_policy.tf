resource "aws_iam_user_policy" "iam_user_policy" {

  name   = var.iam_user_policy_name
  policy = var.iam_user_policy_policy
  user   = var.iam_user_policy_user
}

