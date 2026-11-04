variable "appfabric_app_authorization_connection_app_authorization_arn" {
  description = "(Required) ARN or Universal Unique Identifier (UUID) of the app authorization to use for the request"
  type        = string
}
variable "appfabric_app_authorization_connection_app_bundle_arn" {
  description = "(Required) ARN of the app bundle to use for the request"
  type        = string
}
variable "appfabric_app_authorization_connection_auth_request" {
  description = "(Optional) OAuth2 authorization information. Required if the app authorization for the request is configured with an OAuth2 (oauth2) authorization type"
  type        = list(object({
    code         = string
    redirect_uri = string
  }))
  default     = []
}
