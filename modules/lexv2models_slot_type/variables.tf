variable "lexv2models_slot_type_bot_id" {
  description = "(Required) Identifier of the bot associated with this slot type"
  type        = string
}
variable "lexv2models_slot_type_bot_version" {
  description = "(Required) Version of the bot associated with this slot type"
  type        = string
}
variable "lexv2models_slot_type_description" {
  description = "(Optional) Description of the slot type"
  type        = string
  default     = null
}
variable "lexv2models_slot_type_locale_id" {
  description = "(Required) Identifier of the language and locale where this slot type is used. All of the bots, slot types, and slots used by the intent must have the same locale"
  type        = string
}
variable "lexv2models_slot_type_name" {
  description = "(Required) Name of the slot type"
  type        = string
}
variable "lexv2models_slot_type_parent_slot_type_signature" {
  description = "(Optional) Built-in slot type used as a parent of this slot type. When you define a parent slot type, the new slot type has the configuration of the parent slot type. Only AMAZON.AlphaNumeric is supported"
  type        = string
  default     = null
}
variable "lexv2models_slot_type_composite_slot_type_setting" {
  description = "(Optional) Specifications for a composite slot type"
  type        = list(object({
    sub_slots = optional(list(object({
      name         = string
      slot_type_id = string
    })), [])
  }))
  default     = []
}
variable "lexv2models_slot_type_external_source_setting" {
  description = "(Optional) Type of external information used to create the slot type"
  type        = list(object({
    grammar_slot_type_setting = optional(list(object({
      source = optional(list(object({
        s3_bucket_name = string
        s3_object_key  = string
        kms_key_arn    = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "lexv2models_slot_type_slot_type_values" {
  description = "(Optional) List of SlotTypeValue objects that defines the values that the slot type can take. Each value can have a list of synonyms, additional values that help train the machine learning model about the values that it resolves for a slot"
  type        = list(object({
    sample_value = optional(list(object({
      value = string
    })), [])
    synonyms     = optional(list(object({
      value = string
    })), [])
  }))
  default     = []
}
variable "lexv2models_slot_type_value_selection_setting" {
  description = "(Optional) Determines the strategy that Amazon Lex uses to select a value from the list of possible values"
  type        = list(object({
    resolution_strategy          = string
    advanced_recognition_setting = optional(list(object({
      audio_recognition_strategy = optional(string)
    })), [])
    regex_filter                 = optional(list(object({
      pattern = string
    })), []) 
  }))
  default     = []
}
