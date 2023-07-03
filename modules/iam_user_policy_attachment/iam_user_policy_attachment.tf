resource "aws_iam_user_policy_attachment" "iam_user_policy_attachment" {
  policy_arn = var.iam_user_policy_attachment_policy_arn
  user       = var.iam_user_policy_attachment_user
}
