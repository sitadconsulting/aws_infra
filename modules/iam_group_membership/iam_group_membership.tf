resource "aws_iam_group_membership" "iam_group_membership" {

  name  = var.iam_group_membership_name
  users = var.iam_group_membership_users
  group = var.iam_group_membership_group
}

