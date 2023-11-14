variable "cognito_identity_pool_provider_principal_tag_identity_pool_id" {
  description = "An identity pool ID"
  type        = string
}
variable "cognito_identity_pool_provider_principal_tag_identity_provider_name" {
  description = "The name of the identity provider"
  type        = string
}
variable "cognito_identity_pool_provider_principal_tag_principal_tags" {
  description = "String to string map of variables"
  type        = map(string)
  default     = {}
}
variable "cognito_identity_pool_provider_principal_tag_use_defaults" {
  description = "use default (username and clientID) attribute mappings"
  type        = bool
  default     = true
}
