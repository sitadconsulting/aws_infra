variable "cloudwatch_event_connection_authorization_type" {
  description = "(Required) Type of authorization to use for the connection. One of API_KEY,BASIC,OAUTH_CLIENT_CREDENTIALS"
  type        = string
}
variable "cloudwatch_event_connection_description" {
  description = "(Optional) Description for the connection. Maximum of 512 characters"
  type        = string
  default     = null
}
variable "cloudwatch_event_connection_kms_key_identifier" {
  description = "(Optional) Identifier of the AWS KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt this connection. The identifier can be the key ARN, KeyId, key alias, or key alias ARN"
  type        = string
  default     = null
}
variable "cloudwatch_event_connection_name" {
  description = "(Required) The name for the connection. Maximum of 64 characters consisting of numbers, lower/upper case letters, .,-,_."
  type        = string
}
variable "cloudwatch_event_connection_auth_parameters" {
  description = "(Required) Parameters used for authorization. A maximum of 1 are allowed"
  type        = list(object({
    api_key                    = optional(list(object({
      key   = string
      value = string
    })), [])
    basic                      = optional(list(object({
      password = string
      username = string
    })), [])
    connectivity_parameters    = optional(list(object({
      resource_parameters = list(object({
        resource_configuration_arn = string
      }))
    })), [])
    invocation_http_parameters = optional(list(object({
      body         = optional(list(object({
        is_value_secret = optional(bool)
        key             = optional(string)
        value           = optional(string)
      })), [])
      header       = optional(list(object({
        is_value_secret = optional(bool)
        key             = optional(string)
        value           = optional(string)
      })), [])
      query_string = optional(list(object({
        is_value_secret = optional(bool)
        key             = optional(string)
        value           = optional(string)
      })), [])
    })), [])
    oauth                      = optional(list(object({
      authorization_endpoint = string
      http_method            = string
      client_parameters      = optional(list(object({
        client_id     = string
        client_secret = string
      })), [])
      oauth_http_parameters  = list(object({
        body         = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })), [])
        header       = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })), [])
        query_string = optional(list(object({
          is_value_secret = optional(bool)
          key             = optional(string)
          value           = optional(string)
        })), [])
      }))
    })), [])
  }))
}
variable "cloudwatch_event_connection_invocation_connectivity_parameters" {
  description = "(Optional) Parameters to use for invoking a private API"
  type        = list(object({
    resource_parameters = list(object({
      resource_configuration_arn = string
    }))
  }))
  default     = []
}
