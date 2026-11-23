resource "aws_iot_role_alias" "iot_role_alias" {
  alias               = var.iot_role_alias_alias
  credential_duration = var.iot_role_alias_credential_duration
  role_arn            = var.iot_role_alias_role_arn
  tags                = var.iot_role_alias_tags
}
