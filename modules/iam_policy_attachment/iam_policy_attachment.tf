resource "aws_iam_policy_attachment" "iam_policy_attachment" {
  groups     = var.iam_policy_attachment_groups
  name       = var.iam_policy_attachment_name
  policy_arn = var.iam_policy_attachment_policy_arn
  users      = var.iam_policy_attachment_users
  roles      = var.iam_policy_attachment_roles
}
