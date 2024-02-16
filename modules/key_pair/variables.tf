variable "key_pair_key_name" {
  description = "The name of the key pair to create"
  type        = string
  default     = ""
}
variable "key_pair_key_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with key_name. If neither key_name nor key_name_prefix is provided, Terraform will create a unique key name using the prefix terraform-"
  type        = string
  default     = null
}
variable "key_pair_public_key" {
  description = "The public key of the key pair to create"
  type        = string
  default     = ""
}
variable "key_pair_tags" {
  description = "Additional tags for this key"
  type        = map(string)
  default     = {}
}

