variable "qbusiness_plugin_application_id" {
  description = "The identifier of the application that will contain the plugin"
  type        = string
  default     = null
}
variable "qbusiness_plugin_display_name" {
  description = "The name of the plugin"
  type        = string
}
variable "qbusiness_plugin_server_url" {
  description = "The plugin server URL used for configuration"
  type        = string
  default     = null
}
variable "qbusiness_plugin_state" {
  description = "The current status of the plugin, allowed values: ENABLED | DISABLED"
  type        = string
  default     = null
}
variable "qbusiness_plugin_tags" {
  description = "A list of key-value pairs that identify or categorize the data source connector"
  type        = list(object({
    key   = optional(string)
    value = optional(string)
  }))
  default     = []
}
variable "qbusiness_plugin_type" {
  description = "The type of the plugin, allowed values: SERVICE_NOW | SALESFORCE | JIRA | ZENDESK | CUSTOM | QUICKSIGHT | SERVICENOW_NOW_PLATFORM | JIRA_CLOUD | SALESFORCE_CRM | ZENDESK_SUITE | ATLASSIAN_CONFLUENCE | GOOGLE_CALENDAR | MICROSOFT_TEAMS | MICROSOFT_EXCHANGE | PAGERDUTY_ADVANCE | SMARTSHEET | ASANA"
  type        = string
}
variable "qbusiness_plugin_auth_configuration" {
  description = "Authentication configuration information for an Amazon Q Business plugin"
  type        = object({
    no_auth_configuration = optional(string)
    basic_auth_configuration = optional(object({
      role_arn   = optional(string)
      secret_arn = optional(string)
    })) 
    o_auth_2_client_credential_configuration = optional(object({
      authorization_url = optional(string)
      role_arn          = optional(string)
      secret_arn        = optional(string)
      token_url         = optional(string)
    }))
  })
}
variable "qbusiness_plugin_custom_plugin_configuration" {
  description = "Configuration information required to create a custom plugin"
  type        = object({
    api_schema_type = string
    description     = string
    api_schema =optional(object({
      payload = optional(string)
      s3      = optional(object({
        bucket = string
        key    = string
      }))
    }))
  })
  default     = null
}
