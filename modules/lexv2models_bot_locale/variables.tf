variable "lexv2models_bot_locale_bot_id" {
  description = "(Required) Identifier of the bot to create the locale for"
  type        = string
}
variable "lexv2models_bot_locale_bot_version" {
  description = "(Required) Version of the bot to create the locale for. This can only be the draft version of the bot"
  type        = string
}
variable "lexv2models_bot_locale_description" {
  description = "(Optional) Description of the bot locale. Use this to help identify the bot locale in lists"
  type        = string
  default     = null
}
variable "lexv2models_bot_locale_locale_id" {
  description = "(Required) Identifier of the language and locale that the bot will be used in. The string must match one of the supported locales. All of the intents, slot types, and slots used in the bot must have the same locale"
  type        = string
}
variable "lexv2models_bot_locale_n_lu_intent_confidence_threshold" {
  description = "(Required) Determines the threshold where Amazon Lex will insert the AMAZON.FallbackIntent, AMAZON.KendraSearchIntent, or both when returning alternative intents"
  type        = number
}
variable "lexv2models_bot_locale_voice_settings" {
  description = "(Optional) Amazon Polly voice ID that Amazon Lex uses for voice interaction with the user"
  type        = list(object({
    voice_id = string
    engine   = optional(string)
  }))
  default     = []
}
