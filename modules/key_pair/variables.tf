variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "sitadinfra"
}
variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "DEV"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "key_pair_tags" {
  description = "Additional tags for this key"
  type        = map(string)
  default     = {}
}
variable "key_pair_key_name" {
  description = "The name of the key pair to create"
  type        = string
  default     = ""
}
variable "key_pair_public_key" {
  description = "The public key of the key pair to create"
  type        = string
  default     = ""
}
