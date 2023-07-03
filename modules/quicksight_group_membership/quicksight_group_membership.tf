resource "aws_quicksight_group_membership" "quicksight_group_membership" {
  aws_account_id = var.quicksight_group_membership_aws_account_id
  member_name    = var.quicksight_group_membership_member_name
  group_name     = var.quicksight_group_membership_group_name
  namespace      = var.quicksight_group_membership_namespace
}
