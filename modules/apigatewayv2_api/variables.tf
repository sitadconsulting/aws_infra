variable "apigatewayv2_api_api_key_selection_expression" {
  description = "An API key selection expression. Valid values: $context.authorizer.usageIdentifierKey, $request.header.x-api-key. Defaults to $request.header.x-api-key. Applicable for WebSocket APIs" 
  type        = string
  default     = ""
}
variable "apigatewayv2_api_body" {
  description = "An OpenAPI specification that defines the set of routes and integrations to create as part of the HTTP APIs. Supported only for HTTP APIs"
  type        = string 
  default     = ""
}
variable "apigatewayv2_api_credentials_arn" {
  description = "Part of quick create. Specifies any credentials required for the integration. Applicable for HTTP APIs"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_description" {
  description = "Description of the API. Must be less than or equal to 1024 characters in length"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_disable_execute_api_endpoint" {
  description = "Whether clients can invoke the API by using the default execute-api endpoint. By default, clients can invoke the API with the default {api_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke the API, disable the default endpoint"
  type        = bool
  default     = true
}
variable "apigatewayv2_api_fail_on_warnings" {
  description = "Whether warnings should return an error while API Gateway is creating or updating the resource using an OpenAPI specification. Defaults to false. Applicable for HTTP APIs"
  type        = bool
  default     = false
}
variable "apigatewayv2_api_name" {
  description = "Name of the API. Must be less than or equal to 128 characters in length"
  type        = string
}
variable "apigatewayv2_api_protocol_type" {
  description = "API protocol. Valid values: HTTP, WEBSOCKET"
  type        = string 
}
variable "apigatewayv2_api_route_key" {
  description = "Part of quick create. Specifies any route key. Applicable for HTTP APIs"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_route_selection_expression" {
  description = "The route selection expression for the API. Defaults to $request.method $request.path"
  type        = string 
  default     = ""
}
variable "apigatewayv2_api_target" {
  description = "Part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Applicable for HTTP APIs"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_version" {
  description = "Version identifier for the API. Must be between 1 and 64 characters in length"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_api_tags" {
  description = "Map of tags to assign to the API. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = string
  default     = ""
}
variable "apigatewayv2_api_cors_configuration" {
  description = "Cross-origin resource sharing (CORS) configuration. Applicable for HTTP APIs"
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
