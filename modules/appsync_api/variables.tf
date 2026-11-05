variable "appsync_api_name" {
  description = "(Required) Name of the Event API"
  type        = string
}
variable "appsync_api_owner_contact" {
  description = "(Optional) Contact information for the owner of the Event API"
  type        = string
  default     = null
}
variable "appsync_api_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appsync_api_event_config" {
  description = "(Required) Configuration for the Event API"
  type        = list(object({
    auth_provider               = list(object({
      auth_type                = string
      cognito_config           = optional(list(object({
        app_id_client_regex = optional(string)
        aws_region          = string
        user_pool_id        = string
      })), [])
      lambda_authorizer_config = optional(list(object({
        authorizer_result_ttl_in_seconds = optional(number)
        authorizer_uri                   = string
        identity_validation_expression   = optional(string)
      })), [])
      openid_connect_config    = optional(list(object({
        auth_ttl  = optional(number)
        client_id = optional(string)
        iat_ttl   = optional(number)
        issuer    = string
      })), []) 
    })) 
    connection_auth_mode        = list(object({
      auth_type = string
    }))
    default_publish_auth_mode   = list(object({
      auth_type = string
    }))
    default_subscribe_auth_mode = list(object({
      auth_type = string
    }))
    log_config                  =  optional(list(object({
      cloudwatch_logs_role_arn = string
      log_level                = string
    })), [])
  }))
}
