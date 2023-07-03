resource "aws_quicksight_namespace" "quicksight_namespace" {
  aws_account_id = var.quicksight_namespace_aws_account_id
  identity_store = var.quicksight_namespace_identity_store
  namespace      = var.quicksight_namespace_namespace
  tags           = var.quicksight_namespace_tags
}
