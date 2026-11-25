variable "lexv2models_bot_description" {
  description = "(Optional) Description of the bot. It appears in lists to help you identify a particular bot"
  type        = string
  default     = null
}
variable "lexv2models_bot_idle_session_ttl_in_seconds" {
  description = "(Required) Time, in seconds, that Amazon Lex should keep information about a user's conversation with the bot. You can specify between 60 (1 minute) and 86,400 (24 hours) seconds"
  type        = number
}
variable "lexv2models_bot_name" {
  description = "(Required) Name of the bot. The bot name must be unique in the account that creates the bot. Type String. Length Constraints: Minimum length of 1. Maximum length of 100"
  type        = string
}
variable "lexv2models_bot_role_arn" {
  description = "(Required) ARN of an IAM role that has permission to access the bot"
  type        = string
}
variable "lexv2models_bot_tags" {
  description = "(Optional) List of tags to add to the bot. You can only add tags when you create a bot"
  type        = map(string)
  default     = {}
}
variable "lexv2models_bot_test_bot_alias_tags" {
  description = "(Optional) List of tags to add to the test alias for a bot. You can only add tags when you create a bot"
  type        = map(string)
  default     = {}
}
variable "lexv2models_bot_type" {
  description = "(Optional) Type of a bot to create. Possible values are \"Bot\" and \"BotNetwork\""
  type        = string
  default     = null
}
variable "lexv2models_bot_data_privacy" {
  description = "(Required) Provides information on additional privacy protections Amazon Lex should use with the bot's data"
  type        = list(object({
    child_directed = bool
  }))
}
variable "lexv2models_bot_members" {
  description = "(Optional) List of bot members in a network to be created"
  type        = list(object({
    alias_id   = string
    alias_name = string
    id         = string
    name       = string
    version    = string
  }))
  default     = []
}
