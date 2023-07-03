resource "aws_quicksight_group" "quicksight_group" {
  aws_account_id = var.quicksight_group_aws_account_id
  description    = var.quicksight_group_description
  group_name     = var.quicksight_group_group_name
  namespace      = var.quicksight_group_namespace
}
