resource "aws_lexv2models_bot_locale" "lexv2models_bot_locale" {
  bot_id                           = var.lexv2models_bot_locale_bot_id
  bot_version                      = var.lexv2models_bot_locale_bot_version
  description                      = var.lexv2models_bot_locale_description
  locale_id                        = var.lexv2models_bot_locale_locale_id
  n_lu_intent_confidence_threshold = var.lexv2models_bot_locale_n_lu_intent_confidence_threshold 

  dynamic "voice_settings" {
    for_each = var.lexv2models_bot_locale_voice_settings
      content {
        voice_id = voice_settings.value["voice_id"]
        engine   = voice_settings.value["engine"]
      }
  }
}
