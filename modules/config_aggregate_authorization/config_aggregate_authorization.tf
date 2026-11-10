resource "aws_config_aggregate_authorization" "config_aggregate_authorization" {
  account_id            = var.config_aggregate_authorization_account_id
  authorized_aws_region = var.config_aggregate_authorization_authorized_aws_region
  tags                  - var.config_aggregate_authorization_tags
}
