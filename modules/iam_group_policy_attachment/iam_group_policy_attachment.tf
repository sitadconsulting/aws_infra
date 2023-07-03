resource "aws_iam_group_policy_attachment" "iam_group_policy_attachment" {
  group      = var.iam_group_policy_attachment_group
  policy_arn = var.iam_group_policy_attachment_policy_arn
}
