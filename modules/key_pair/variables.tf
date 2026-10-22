variable "key_pair_key_name" {
  description = "(Optional) Name for the key pair. If neither key_name nor key_name_prefix is provided, Terraform will create a unique key name using the prefix terraform-"
  type        = string
  default     = null
}
variable "key_pair_key_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with key_name. If neither key_name nor key_name_prefix is provided, Terraform will create a unique key name using the prefix terraform-"
  type        = string
  default     = null
}
variable "key_pair_public_key" {
  description = "(Required) Public key material"
  type        = string
  default     = null
}
variable "key_pair_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}

