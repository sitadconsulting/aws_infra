variable "kms_alias_name" {
  description = "(Optional) Display name of the alias. The name must start with the word \"alias\" followed by a forward slash (alias/)"
  type        = string
  default     = null
}
variable "kms_alias_name_prefix" {
  description = "(Optional) Creates a unique alias beginning with the specified prefix. The name must start with the word \"alias\" followed by a forward slash (alias/). Conflicts with name"
  type        = string
  default     = null
}
variable "kms_alias_target_key_id" {
  description = "(Required) Identifier for the key for which the alias is for, can be either an ARN or key_id"
  type        = string
}
