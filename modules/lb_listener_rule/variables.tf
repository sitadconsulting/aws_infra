variable "lb_listener_rule_listener_arn" {
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule"
  type        = string
}
variable "lb_listener_rule_priority" {
  description = "(Optional) The priority for the rule between 1 and 50000. Leaving it unset will automatically set the rule with next available priority after currently existing highest rule. A listener can't have multiple rules with the same priority"
  type        = number
  default     = null
}
variable "lb_listener_rule_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_listener_rule_action" {
  description = "(Required) An Action block"
  type        = list(object({
    order                = optional(number)
    target_group_arn     = optional(string)
    type                 = string
    authenticate_cognito = optional(list(object({
      authentication_request_extra_params = optional(map(string))
      on_unauthenticated_request          = optional(string)
      scope                               = optional(string)
      session_cookie_name                 = optional(string)
      session_timeout                     = optional(number)
      user_pool_arn                       = string
      user_pool_client_id                 = string
      user_pool_domain                    = string
    })), []) 
    authenticate_oidc    = optional(list(object({
      authentication_request_extra_params = optional(map(string))
      authorization_endpoint              = string
      client_id                           = string
      client_secret                       = string
      issuer                              = string
      on_unauthenticated_request          = optional(string)
      scope                               = optional(string)
      session_cookie_name                 = optional(string)
      session_timeout                     = optional(number)
      token_endpoint                      = string
      user_info_endpoint                  = string
    })), [])
    fixed_response       = optional(list(object({
      content_type = string
      message_body = optional(string)
      status_code  = optional(string)
    })), [])
    forward              = optional(list(object({
      target_group = optional(list(object({
        arn    = string
        weight = optional(string)
      })), [])
      stickiness   = optional(list(object({
        enabled  = optional(bool)
        duration = number
      })), [])
    })), [])
    jwt_validation       = optional(list(object({
      issuer           = string
      jwks_endpoint    = string
      additional_claim = optional(list(object({
        format           = string
        name             = string
        values           = list(string)
      })), [])
    })), [])
    redirect             = optional(list(object({
      host        = optional(string)
      path        = optional(string)
      port        = optional(string)
      protocol    = optional(string)
      query       = optional(string)
      status_code = string
    })), [])
  }))
}
variable "lb_listener_rule_condition" {
  description = "(Required) A Condition block. Multiple condition blocks of different types can be set and all must be satisfied for the rule to match"
  type        = list(object({
    host_header         = optional(list(object({
      regex_values = optional(list(string))
      values       = optional(list(string))
    })), [])
    http_header         = optional(list(object({
      http_header_name = string
      regex_values     = optional(list(string))
      values           = optional(list(string))
    })), [])
    http_request_method = optional(list(object({
      values = list(string)
    })), [])
    path_pattern        = optional(list(object({
      regex_values = optional(list(string))
      values       = optional(list(string))
    })), [])
    query_string        = optional(list(object({
      values = optional(list(object({
        key   = optional(string)
        value = string
      })), [])
    })), [])
    source_ip           = optional(list(object({
      values          = optonal(string)
      ip_address_type = optional(list(string))
    })), [])
  }))
}
variable "lb_listener_rule_transform" {
  description = "(Optional) Configuration block that defines the transform to apply to requests matching this rule"
  type        = list(object({
    type                       = string
    host_header_rewrite_config = optional(list(object({
      rewrite = optional(list(object({
         regex   = string
         replace = string
      })), [])
    })), [])
    url_rewrite_config         = optional(list(object({
      rewrite = optional(list(object({
        regex   = string
        replace = string
      })), [])
    })), [])
  }))
  default     = []
}
