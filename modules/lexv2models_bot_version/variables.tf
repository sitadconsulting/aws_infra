variable "lexv2models_bot_version_bot_id" {
  description = "(Required) Idientifier of the bot to create the version for"
  type        = string
}
variable "lexv2models_bot_version_description" {
  description = "(Optional) A description of the version. Use the description to help identify the version in lists"
  type        = string 
  default     = null
}
variable "lexv2models_bot_version_locale_specification" {
  description = "(Required) Specifies the locales that Amazon Lex adds to this version. You can choose the draft version or any other previously published version for each locale. When you specify a source version, the locale data is copied from the source version to the new version"
  type        = map(string)
}
variable "lexv2models_bot_version_sourceBotVersion" {
  description = "(Required) The version of a bot used for a bot locale. Valid values: DRAFT, a numeric version"
  type        = string
}
