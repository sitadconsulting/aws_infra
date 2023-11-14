variable "cognito_identity_pool_identity_pool_name" {
  description = "The Cognito Identity Pool name"
  type        = string
}
variable "cognito_identity_pool_developer_provider_name" {
  description = "The \"domain\" by which Cognito will refer to your users. This name acts as a placeholder that allows your backend and the Cognito service to communicate about the developer provider"
  type        = string
  default     = null
}
variable "cognito_identity_pool_allow_unauthenticated_identities" {
  description = "Whether the identity pool supports unauthenticated logins or not"
  type        = bool
  default     = true
}
variable "cognito_identity_pool_allow_classic_flow" {
  description = "Enables or disables the classic / basic authentication flow. Default is false"
  type        = bool
  default     = false
}
variable "cognito_identity_pool_openid_connect_provider_arns" {
  description = "Set of OpendID Connect provider ARNs"
  type        = list(string)
  default     = []
}
variable "cognito_identity_pool_saml_provider_arns" {
  description = "An array of Amazon Resource Names (ARNs) of the SAML provider for your identity"
  type        = list(string)
  default     = []
}
variable "cognito_identity_pool_supported_login_providers" {
  description = "Key-Value pairs mapping provider names to provider app IDs"
  type        = map(string)
  default     = {}
}
variable "cognito_identity_pool_tags" {
  description = "A map of tags to assign to the Identity Pool. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "cognito_identity_pool_cognito_identity_providers" {
  description = "An array of Amazon Cognito Identity user pools and their client IDs"
  type        = list(object({
    client_id                = optional(string)
    provider_name            = optional(string)
    server_side_token_check  = optional(bool)
  }))
  default     = []
}
