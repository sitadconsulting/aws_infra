variable "lb_listener_load_balancer_arn" {
  description = "ARN of the load balancer"
  type        = string
}
variable "lb_lb_listener_alpn_policy" {
  description = "Name of the Application-Layer Protocol Negotiation (ALPN) policy. Can be set if protocol is TLS. Valid values are HTTP1Only, HTTP2Only, HTTP2Optional, HTTP2Preferred, and None"
  type        = string
  default     = null
}
variable "lb_lb_listener_certificate_arn" {
  description = "ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
  type        = string
  default     = null
}
variable "lb_lb_listener_port" {
  description = "Port on which the load balancer is listening. Not valid for Gateway Load Balancers"
  type        = number
  default     = null
}
variable "lb_lb_listener_protocol" {
  description = " Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. For Network Load Balancers, valid values are TCP, TLS, UDP, and TCP_UDP. Not valid to use UDP or TCP_UDP if dual-stack mode is enabled. Not valid for Gateway Load Balancers"
  type        = string
  default     = null
}
variable "lb_lb_listener_ssl_policy" {
  description = "Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS"
  type        = string
  default     = null
}
variable "lb_lb_listener_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_listener_default_action" {
  description = "routing actions"
  type        = list(object({
    authenticate_cognito = optional(list(object({
      authentication_request_extra_params = map(string)
      on_unauthenticated_request          = optional(string)
      scope                               = optional(string)
      session_cookie_name                 = optional(string)
      session_timeout                     = optional(number)
      user_pool_arn                       = string
      user_pool_client_id                 = string
      user_pool_domain                    = string
    })), [])
    authenticate_oidc   = optional(list(object({
      authentication_request_extra_params = map(string)
      authorization_endpoint              = string
      client_id                           = string
      client_secret                       = string
      issuer                              = string
      on_unauthenticated_request          = optional(string)
      scope                               = optional(string)
      session_cookie_name                 = optional(string)
      session_timeout                     = optional(string)
      token_endpoint                      = string
      user_info_endpoint                  = string
    })), [])
    fixed_response     = optional(list(object({
      content_type     = string
      message_body     = optional(string)
      status_code      = optional(string)
    })), [])
    forward            = optional(list(object({
      target_group     = list(object({
        arn            = string
        weight         = optional(number)
      })) 
      stickiness       = optional(list(object({
        duration       = number
        enabled        = bool
      })), [])
    })), [])
    order              = optional(number)
    redirect           = optional(list(object({
      host             = optional(string)
      path             = optional(string)
      port             = optional(string)
      protocol         = optional(string)
      query            = optional(string)
      status_code      = string
    })), [])
    target_group_arn   = optional(string)
    type               = string
  }))
  default    = [] 
}
