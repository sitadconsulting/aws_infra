variable "cognito_managed_user_pool_client_access_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. By default, the unit is hours. The unit can be overridden by a value in token_validity_units.access_token"
  type        = number
  default     = null
}
variable "cognito_managed_user_pool_client_allowed_oauth_flows" {
  description = "List of allowed OAuth flows, including code, implicit, and client_credentials"
  type        = list(string)
  default     = []
}
variable "cognito_managed_user_pool_client_allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to use the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = true
}
variable "cognito_managed_user_pool_client_allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes, including phone, email, openid, profile, and aws.cognito.signin.user.admin"
  type        = list(string)
  default     = []
}
variable "cognito_managed_user_pool_client_auth_session_validity" {
  description = "Duration, in minutes, of the session token created by Amazon Cognito for each API request in an authentication flow. The session token must be responded to by the native user of the user pool before it expires. Valid values for auth_session_validity are between 3 and 15, with a default value of 3"
  type        = number
  default     = 3
}
variable "cognito_managed_user_pool_client_callback_urls" {
  description = "List of allowed callback URLs for the identity providers"
  type        = list(string)
  default     = []
}
variable "cognito_managed_user_pool_client_default_redirect_uri" {
  description = "Default redirect URI and must be included in the list of callback URLs"
  type        = string
  default     = null
}
variable "cognito_managed_user_pool_client_enable_propagate_additional_user_context_data" {
  description = "Enables the propagation of additional user context data"
  type        = bool
  default     = false
}
variable "cognito_managed_user_pool_client_enable_token_revocation" {
  description = "Enables or disables token revocation"
  type        = bool
  default     = true
}
variable "cognito_managed_user_pool_client_explicit_auth_flows" {
  description = "List of authentication flows. The available options include ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, and ALLOW_REFRESH_TOKEN_AUTH"
  type        = list(string)
  default     = null
}
variable "cognito_managed_user_pool_client_id_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. By default, the unit is hours. The unit can be overridden by a value in token_validity_units.id_token"
  type        = number
  default     = null
}
variable "cognito_managed_user_pool_client_logout_urls" {
  description = "List of allowed logout URLs for the identity providers"
  type        = list(string)
  default     = []
}
variable "cognito_managed_user_pool_client_name_pattern" {
  description = "Regular expression that matches the name of the desired User Pool Client. It must only match one User Pool Client"
  type        = string
  default     = null
}
variable "cognito_managed_user_pool_client_name_prefix" {
  description = "String that matches the beginning of the name of the desired User Pool Client. It must match only one User Pool Client"
  type        = string
  default     = null
}
variable "cognito_managed_user_pool_client_prevent_user_existence_errors" {
  description = "Setting determines the errors and responses returned by Cognito APIs when a user does not exist in the user pool during authentication, account confirmation, and password recovery"
  type        = string
  default     = null
}
variable "cognito_managed_user_pool_client_read_attributes" {
  description = "List of user pool attributes that the application client can read from"
  type        = list(string)
  default     = []
}
variable "cognito_managed_user_pool_client_refresh_token_validity" {
  description = "Time limit, between 60 minutes and 10 years, after which the refresh token is no longer valid and cannot be used. By default, the unit is days. The unit can be overridden by a value in token_validity_units.refresh_token"
  type        = number
  default     = null
}
variable "cognito_managed_user_pool_client_supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client. It uses the provider_name attribute of the aws_cognito_identity_provider resource(s), or the equivalent string(s)"
  type        = list(string)
  default     = null
}
variable "cognito_managed_user_pool_client_user_pool_id" {
  description = "User pool that the client belongs to"
  type        = string
}
variable "cognito_managed_user_pool_client_write_attributes" {
  description = "List of user pool attributes that the application client can write to"
  type        = list(string)
  default     = null
}
variable "cognito_managed_user_pool_client_analytics_configuration" {
  description = "Configuration block for Amazon Pinpoint analytics that collects metrics for this user pool"
  type        = list(object({
    application_arn  = optional(string)
    application_id   = optional(string)
    external_id      = optional(string)
    role_arn         = optional(string)
    user_data_shared = optional(bool)
  }))
  default     = []
}
variable "cognito_managed_user_pool_client_token_validity_units" {
  description = "Configuration block for representing the validity times in units"
  type        = list(object({
    access_token  = optional(string)
    id_token      = optional(string)
    refresh_token = optional(string)
  }))
  default     = []
}
