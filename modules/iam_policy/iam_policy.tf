resource "aws_iam_policy" "iam_policy" {
  description = var.iam_policy_description
  name        = var.iam_policy_name
  name_prefix = var.iam_policy_name_prefix
  policy      = var.iam_policy_policy
  path        = var.iam_policy_path
  tags        = var.iam_policy_tags

  lifecycle {
    create_before_destroy = true
    ignore_changes        = all
  }
}
