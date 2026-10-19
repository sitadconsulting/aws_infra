resource "aws_iam_policy" "iam_policy" {
  delay_after_policy_creation_in_ms = var.iam_policy_delay_after_policy_creation_in_ms
  description                       = var.iam_policy_description
  name                              = var.iam_policy_name
  name_prefix                       = var.iam_policy_name_prefix
  path                              = var.iam_policy_path
  policy                            = var.iam_policy_policy
  tags                              = var.iam_policy_tags
}
