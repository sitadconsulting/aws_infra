resource "aws_lexv2models_bot" "lexv2models_bot" {
  description                 = var.lexv2models_bot_description
  idle_session_ttl_in_seconds = var.lexv2models_bot_idle_session_ttl_in_seconds
  name                        = var.lexv2models_bot_name
  role_arn                    = var.lexv2models_bot_role_arn
  tags                        = var.lexv2models_bot_tags
  test_bot_alias_tags         = var.lexv2models_bot_test_bot_alias_tags
  type                        = var.lexv2models_bot_type

  dynamic "data_privacy" {
    for_each = var.lexv2models_bot_data_privacy
      content {
        child_directed = data_privacy.value["child_directed"]
      }
  }
  dynamic "members" {
    for_each = var.lexv2models_bot_members
      content {
        alias_id   = members.value["alias_id"]
        alias_name = members.value["alias_name"]
        id         = members.value["id"]
        name       = members.value["name"]
        version    = members.value["version"]
      }
  }
}
