resource "aws_iam_group_policy_attachments_exclusive" "iam_group_policy_attachments_exclusive" {
  group_name  = var.iam_group_policy_attachments_exclusive_group_name
  policy_arns = var.iam_group_policy_attachments_exclusive_policy_arns
}
