variable "cognito_user_pool_client_access_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. By default, the unit is hours. The unit can be overridden by a value in token_validity_units.access_token"
  type        = number
  default     = 18
}
variable "cognito_user_pool_client_allowed_oauth_flows" {
  description = "List of allowed OAuth flows (code, implicit, client_credentials)"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_client_allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = true
}
variable "cognito_user_pool_client_allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_client_auth_session_validity" {
  description = "Amazon Cognito creates a session token for each API request in an authentication flow. AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires. Valid values between 3 and 15. Default value is 3"
  type        = number
  default     = 3
}
variable "cognito_user_pool_client_callback_urls" {
  description = "List of allowed callback URLs for the identity providersList of allowed callback URLs for the identity providers"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_client_default_redirect_uri" {
  description = "Default redirect URI. Must be in the list of callback URLs"
  type        = string
  default     = null
}
variable "cognito_user_pool_client_enable_propagate_additional_user_context_data" {
  description = "Activates the propagation of additional user context data"
  type        = bool
  default     = true
}
variable "cognito_user_pool_client_enable_token_revocation" {
  description = "Enables or disables token revocation"
  type        = bool
  default     = true
}
variable "cognito_user_pool_client_explicit_auth_flows" {
  description = "List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH)"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_client_generate_secret" {
  description = "Should an application secret be generated"
  type        = bool
  default     = false
}
variable "cognito_user_pool_client_id_token_validity" {
  description = "Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. By default, the unit is hours. The unit can be overridden by a value in token_validity_units.id_token"
  type        = number
  default     = 18
}
variable "cognito_user_pool_client_logout_urls" {
  description = "List of allowed logout URLs for the identity providers"
  type        = list(string)
  default     = null
}
variable "cognito_user_pool_client_name" {
  description = "Name of the application client"
  type        = string
}
variable "cognito_user_pool_client_prevent_user_existence_errors" {
  description = "Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. When set to ENABLED and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to LEGACY, those APIs will return a UserNotFoundException exception if the user does not exist in the user pool"
  type        = string
  default     = "ENABLED"
}
variable "cognito_user_pool_client_read_attributes" {
  description = "List of user pool attributes the application client can read from"
  type        = list(string)
  default     = []
}
variable "cognito_user_pool_client_refresh_token_validity" {
  description = "Time limit, between 60 minutes and 10 years, after which the refresh token is no longer valid and cannot be used. By default, the unit is days. The unit can be overridden by a value in token_validity_units.refresh_token"
  type        = number
  default     = 30
}
variable "cognito_user_pool_client_supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client. Uses the provider_name attribute of aws_cognito_identity_provider resource(s), or the equivalent string(s)"
  type        = list(string)
  default     = []
}
variable "cognito_user_pool_client_user_pool_id" {
  description = "User pool the client belongs to"
  type        = string
}
variable "cognito_user_pool_client_write_attributes" {
  description = "List of user pool attributes the application client can write to"
  type        = list(string)
  default     = []
}
variable "cognito_user_pool_client_analytics_configuration" {
  description = "Configuration block for Amazon Pinpoint analytics for collecting metrics for this user pool"
  type        = list(object({
    application_arn  = optional(string)
    application_id   = optional(string)
    external_id      = optional(string)
    role_arn         = optional(string)
    user_data_shared = optional(bool)
  }))
  default     = []
}
variable "cognito_user_pool_client_token_validity_units" {
  description = "Configuration block for units in which the validity times are represented in"
  type        = list(object({
    access_token  = optional(string)
    id_token      = optional(string)
    refresh_token = optional(string)
  }))
  default     = []
}
