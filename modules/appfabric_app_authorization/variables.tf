variable "appfabric_app_authorization_app" {
  description = "(Required) Name of the application. For valid values"
  type        = string
}
variable "appfabric_app_authorization_app_bundle_arn" {
  description = "(Required) ARN of the app bundle to use for the request"
  type        = string
}
variable "appfabric_app_authorization_auth_type" {
  description = "(Required) Authorization type for the app authorization. Valid values are oauth2 and apiKey"
  type        = string
}
variable "appfabric_app_authorization_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appfabric_app_authorization_credential" {
  description = "(Required) Credentials for the application, such as an API key or OAuth2 client ID and secret. Specify credentials that match the authorization type for your request. For example, if the authorization type for your request is OAuth2 (oauth2), then you should provide only the OAuth2 credentials"
  type        = list(object({
    api_key_credential = optional(list(object({
      api_key = string
    })), [])
    oauth2_credential  = optional(list(object({
      client_id     = string
      client_secret = string
    })), [])
  }))
}
variable "appfabric_app_authorization_tenant" {
  description = "(Required) Information about an application tenant, such as the application display name and identifier"
  type        = list(object({
    tenant_display_name = string
    tenant_identifier   = string
  }))
}
