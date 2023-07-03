resource "aws_quicksight_folder" "quicksight_folder" {
  aws_account_id    = var.quicksight_folder_aws_account_id
  folder_id         = var.quicksight_folder_folder_id
  folder_type       = var.quicksight_folder_folder_type
  name              = var.quicksight_folder_name
  parent_folder_arn = var.quicksight_folder_parent_folder_arn
  tags              = var.quicksight_folder_tags

  dynamic "permissions" {
    for_each = var.quicksight_folder_permissions
      content {
        actions   = permissions.value["actions"]
        principal = permissions.value["principal"]
      }
  }
}
