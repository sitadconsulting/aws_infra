resource "aws_iam_role_policy_attachments_exclusive" "iam_role_policy_attachments_exclusive" {
  policy_arns = var.iam_role_policy_attachments_exclusive_policy_arns
  role_name   = var.iam_role_policy_attachments_exclusive_role_name
}
