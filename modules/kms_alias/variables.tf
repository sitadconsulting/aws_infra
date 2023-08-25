variable "kms_alias_name" {
  description = "The display name of the alias"
  type        = string
}
variable "kms_alias_name_prefix" {
  description = "Creates an unique alias beginning with the specified prefix"
  type        = string
  default     = null
}
variable "kms_alias_target_key_id" {
  description = "Identifier for the key for which the alias is for, can be either an ARN or key_id"
  type        = string
}
