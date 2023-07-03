resource "aws_quicksight_folder_membership" "quicksight_folder_membership" {
  aws_account_id = var.quicksight_folder_membership_aws_account_id
  folder_id      = var.quicksight_folder_membership_folder_id
  member_id      = var.quicksight_folder_membership_member_id
  member_type    = var.quicksight_folder_membership_member_type
}
