variable "appsync_channel_namespace_api_id" {
  description = "(Required) Event API ID"
  type        = string
}
variable "appsync_channel_namespace_code_handlers" {
  description = "(Optional) Event handler functions that run custom business logic to process published events and subscribe requests"
  type        = string
  default     = null
}
variable "appsync_channel_namespace_name" {
  description = "(Required) Name of the channel namespace"
  type        = string
}
variable "appsync_channel_namespace_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appsync_channel_namespace_handler_configs" {
  description = "(Optional) Configuration for the on_publish and on_subscribe handlers"
  type        = list(object({
    on_publish   = optional(list(object({
      behavior    = string
      integration = list(object({
        data_source_name = string
        lambda_config    = optional(list(object({
          invoke_type = optional(string)
        })), [])
      }))
    })), [])
    on_subscribe = optional(list(object({
      behavior    = string
      integration = list(object({
        data_source_name = string
        lambda_config    = optional(list(object({
          invoke_type = optional(string)
        })), [])
      }))
    })), [])
  }))
  default     = []
}
variable "appsync_channel_namespace_publish_auth_mode" {
  description = "(Optional) Authorization modes to use for publishing messages on the channel namespace. This configuration overrides the default API authorization configuration"
  type        = list(object({
    auth_type = string
  }))
  default     = []
}
variable "appsync_channel_namespace_subscribe_auth_mode" {
  description = "(Optional) Authorization modes to use for subscribing to messages on the channel namespace. This configuration overrides the default API authorization configuration"
  type        = list(object({
    auth_type = string
  }))
  default     = []
}
