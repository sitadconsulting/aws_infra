variable "datazone_glossary_description" {
  description = "(Optional) Description of the glossary. Must have a length between 0 and 4096"
  type        = string
  default     = null
}
variable "datazone_glossary_name" {
  description = "(Required) Name of the glossary. Must have length between 1 and 256"
  type        = string
}
variable "datazone_glossary_owning_project_identifier" {
  description = "(Required) ID of the project that owns business glossary. Must follow regex of ^[a-zA-Z0-9_-]{1,36}$"
  type        = string
}
variable "datazone_glossary_status" {
  description = "(Optional) Status of business glossary. Valid values are DISABLED and ENABLED"
  type        = string
  default     = null
}
