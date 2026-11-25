resource "aws_lexv2models_bot_version" "lexv2models_bot_version" {
  bot_id               = var.lexv2models_bot_version_bot_id
  description          = var.lexv2models_bot_version_description
  locale_specification = var.lexv2models_bot_version_locale_specification
  sourceBotVersion     = var.lexv2models_bot_version_sourceBotVersion
}
