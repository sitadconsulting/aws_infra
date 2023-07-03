resource "aws_quicksight_template_alias" "quicksight_template_alias" {
  aws_account_id          = var.quicksight_template_alias_aws_account_id
  alias_name              = var.quicksight_template_alias_alias_name
  template_id             = var.quicksight_template_alias_template_id
  template_version_number = var.quicksight_template_alias_template_version_number
}
