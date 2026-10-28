variable "apigatewayv2_api_api_key_selection_expression" {
  description = "(Optional) API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key. Defaults to $request.header.x-api-key. Applicable for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_api_body" {
  description = "(Optional) OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs"
  type        = string 
  default     = null
}
variable "apigatewayv2_api_credentials_arn" {
  description = "(Optional) Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_api_description" {
  description = "(Optional) Description of the API. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_api_disable_execute_api_endpoint" {
  description = "(Optional) Whether clients can invoke the API by using the default execute-api endpoint. By default, clients can invoke the API with the default {api_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint"
  type        = bool
  default     = true
}
variable "apigatewayv2_api_fail_on_warnings" {
  description = "(Optional) Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to false. Applicable for HTTP APIs"
  type        = bool
  default     = false
}
variable "apigatewayv2_api_name" {
  description = "(Required) Name of the API. Must be less than or equal to 128 characters in length"
  type        = string
}
variable "apigatewayv2_api_protocol_type" {
  description = "(Required) API protocol. Valid values: HTTP, WEBSOCKET"
  type        = string 
}
variable "apigatewayv2_api_ip_address_type" {
  description = "(Optional) IP address types that can invoke the API. Valid values: ipv4, dualstack. Use ipv4 to allow only IPv4 addresses to invoke your API, or use dualstack to allow both IPv4 and IPv6 addresses to invoke your API. Defaults to ipv4"
  type        = string
  default     = null
}
variable "apigatewayv2_api_route_key" {
  description = "(Optional) Part of quick create. Specifies any route key. Applicable for HTTP APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_api_route_selection_expression" {
  description = "(Optional) Route selection expression for the API. Defaults to $request.method $request.path"
  type        = string 
  default     = null
}
variable "apigatewayv2_api_tags" {
  description = "(Optional) Map of tags to assign to the API"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_api_target" {
  description = "(Optional) Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Applicable for HTTP APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_api_version" {
  description = "(Optional) Version identifier for the API. Must be between 1 and 64 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_api_cors_configuration" {
  description = "(Optional) Cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs"
  type        = list(object({
     allow_credentials = optional(bool)
     allow_headers     = optional(list(string))
     allow_methods     = optional(list(string))
     allow_origins     = optional(list(string))
     expose_headers    = optional(list(string))
     max_age           = optional(number)
  })) 
  default     = []
}
