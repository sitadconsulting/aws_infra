variable "connect_vocabulary_content" {
  description = "(Required) The content of the custom vocabulary in plain-text format with a table of values. Each row in the table represents a word or a phrase, described with Phrase, IPA, SoundsLike, and DisplayAs fields. Separate the fields with TAB characters. For more information, see Create a custom vocabulary using a table. Minimum length of 1. Maximum length of 60000."
  type        = string
}
variable "connect_vocabulary_instance_id" {
  description = "(Required) Specifies the identifier of the hosting Amazon Connect Instance"
  type        = string
}
variable "connect_vocabulary_language_code" {
  description = "(Required) The language code of the vocabulary entries. For a list of languages and their corresponding language codes, Valid Values are ar-AE, de-CH, de-DE, en-AB, en-AU, en-GB, en-IE, en-IN, en-US, en-WL, es-ES, es-US, fr-CA, fr-FR, hi-IN, it-IT, ja-JP, ko-KR, pt-BR, pt-PT, zh-CN"
  type        = string
}
variable "connect_vocabulary_name" {
  description = "(Required) A unique name of the custom vocabulary. Must not be more than 140 characters"
  type        = string
}
variable "connect_vocabulary_tags" {
  description = "(Optional) Tags to apply to the vocabulary"
  type        = map(string)
  default     = {}
}
