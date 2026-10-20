resource "aws_iam_user_policy_attachments_exclusive" "iam_user_policy_attachments_exclusive" {
  policy_arns = var.iam_user_policy_attachments_exclusive_policy_arns
  user_name   = var.iam_user_policy_attachments_exclusive_user_name
}
