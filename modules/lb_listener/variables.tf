variable "lb_listener_load_balancer_arn" {
  description = "(Required, Forces New Resource) ARN of the load balancer"
  type        = string
}
variable "lb_lb_listener_alpn_policy" {
  description = "(Optional) Name of the Application-Layer Protocol Negotiation (ALPN) policy. Can be set if protocol is TLS. Valid values are HTTP1Only, HTTP2Only, HTTP2Optional, HTTP2Preferred, and None"
  type        = string
  default     = null
}
variable "lb_lb_listener_certificate_arn" {
  description = "(Optional) ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
  type        = string
  default     = null
}
variable "lb_lb_listener_port" {
  description = "(Optional) Port on which the load balancer is listening. Not valid for Gateway Load Balancers"
  type        = number
  default     = null
}
variable "lb_lb_listener_protocol" {
  description = "(Optional) Protocol for connections from clients to the load balancer. For Application Load Balancers, valid values are HTTP and HTTPS, with a default of HTTP. For Network Load Balancers, valid values are TCP, TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC. Not valid to use UDP or TCP_UDP if dual-stack mode is enabled. Not valid to use QUIC or TCP_QUIC if security groups are configured or dual-stack mode is enabled. Not valid for Gateway Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_server_enabled" {
  description = "(Optional) Enables you to allow or remove the HTTP response server header. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Valid values are true or false"
  type        = bool
  default     = null
}
variable "lb_listener_routing_http_response_strict_transport_security_header_value" {
  description = "(Optional) Informs browsers that the site should only be accessed using HTTPS, and that any future attempts to access it using HTTP should automatically be converted to HTTPS. Default values are max-age=31536000; includeSubDomains; preload consult the Strict-Transport-Security documentation for further details"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_allow_origin_header_value" {
  description = "(Optional) Specifies which origins are allowed to access the server. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. A valid value is a URI, eg: https://example.com"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_allow_methods_header_value" {
  description = "(Optional) Set which HTTP methods are allowed when accessing the server from a different origin. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Valid values are GET, HEAD, POST, DELETE, CONNECT, OPTIONS, TRACE or PATCH"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_allow_headers_header_value" {
  description = "(Optional) Specifies which headers can be used during the request. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Valid values are *, Accept, Accept-Language, Cache-Control, Content-Language, Content-Length, Content-Type, Expires, Last-Modified, Pragma. Dependent on your use-case other headers can be exposed and then set as a value consult the Access-Control-Allow-Headers documentation"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_allow_credentials_header_value" {
  description = "(Optional) Specifies which headers the browser can expose to the requesting client. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. The only valid value is true"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_expose_headers_header_value" {
  description = "(Optional) Specifies whether the browser should include credentials such as cookies or authentication when making requests. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Valid values are *, Cache-Control, Content-Language, Content-Length, Content-Type, Expires, Last-Modified, or Pragma. Dependent on your use-case other headers can be exposed, consult the Access-Control-Expose-Headers documentation"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_access_control_max_age_header_value" {
  description = "(Optional) Specifies how long the results of a preflight request can be cached, in seconds. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Valid values are between 0 and 86400. This value is browser specific, consult the Access-Control-Max-Age documentation"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_content_security_policy_header_value" {
  description = " (Optional) Specifies restrictions enforced by the browser to help minimize the risk of certain types of security threats. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. Values for this are extensive, and can be impactful when set, consult Content-Security-Policy documentation"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_x_content_type_options_header_value" {
  description = "(Optional) Indicates whether the MIME types advertised in the Content-Type headers should be followed and not be changed. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. The only valid value is nosniff"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_response_x_frame_options_header_value" {
  description = "(Optional) Indicates whether the browser is allowed to render a page in a frame, iframe, embed or object. Can only be set if protocol is HTTP or HTTPS for Application Load Balancers. Not supported for Network Load Balancer, or with a Gateway Load Balancer. The only valid values are DENY, SAMEORIGIN, or ALLOW-FROM https://example.com"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Serial-Number HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_issuer_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Issuer HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_subject_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Subject HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_validity_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Validity HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_leaf_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert-Leaf HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_mtls_clientcert_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Mtls-Clientcert HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_tls_version_header_name" {
  description = "(Optional) Enables you to modify the header name of the X-Amzn-Tls-Version HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_listener_routing_http_request_x_amzn_tls_cipher_suite_header_name" {
  description = " (Optional) Enables you to modify the header name of the X-Amzn-Tls-Cipher-Suite HTTP request header. Can only be set if protocol is HTTPS for Application Load Balancers"
  type        = string
  default     = null
}
variable "lb_lb_listener_ssl_policy" {
  description = "(Optional) Name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS. Default is ELBSecurityPolicy-2016-08"
  type        = string
  default     = null
}
variable "lb_lb_listener_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "lb_listener_tcp_idle_timeout_seconds" {
  description = "(Optional) TCP idle timeout value in seconds. Can only be set if protocol is TCP on Network Load Balancer, or with a Gateway Load Balancer. Not supported for Application Load Balancers. Valid values are between 60 and 6000 inclusive. Default: 350"
  type        = number
  default     = null
}
variable "lb_listener_default_action" {
  description = "routing actions"
  type        = list(object({
    order              = optional(number)
    target_group_arn   = optional(string)
    type               = string
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
    authenticate_oidc   = optional(list(object({
      authentication_request_extra_params = optional(map(string))
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
    mutual_authentication = optional(list(object({
      advertise_trust_store_ca_names   = optional(string)
      ignore_client_certificate_expiry = optional(bool)
      mode                             = string
      trust_store_arn                  = string
    })), [])
    redirect           = optional(list(object({
      host             = optional(string)
      path             = optional(string)
      port             = optional(string)
      protocol         = optional(string)
      query            = optional(string)
      status_code      = string
    })), [])
  }))
  default    = [] 
}
