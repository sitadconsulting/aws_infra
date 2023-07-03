resource "aws_iam_user" "iam_user" {
  force_destroy        = var.iam_user_force_destroy
  name                 = var.iam_user_name
  path                 = var.iam_user_path
  permissions_boundary = var.iam_user_permissions_boundary
  tags                 = var.iam_user_tags
}

