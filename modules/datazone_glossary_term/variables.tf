variable "datazone_glossary_term_domain_identifier" {
  description = "(Required) Identifier of domain"
  type        = string
}
variable "datazone_glossary_term_glossary_identifier" {
  description = "(Required) Identifier of glossary"
  type        = string
}
variable "datazone_glossary_term_long_description" {
  description = "(Optional) Long description of entry"
  type        = string
  default     = null
}
variable "datazone_glossary_term_name" {
  description = "(Required) Name of glossary term"
  type        = string
}
variable "datazone_glossary_term_short_description" {
  description = "(Optional) Short description of entry"
  type        = string
  default     = null
}
variable "datazone_glossary_term_status" {
  description = "(Optional) If glossary term is ENABLED or DISABLED"
  type        = string
  default     = null
}
variable "datazone_glossary_term_term_relations" {
  description = "(Optional) Object classifying the term relations through the following attributes"
  type        = list(object({
    classifies = optional(list(string))
    is_as      = optional(list(string))
  }))
  default     = []
}
