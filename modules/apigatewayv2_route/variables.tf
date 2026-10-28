variable "apigatewayv2_route_api_id" {
  description = "(Required) API identifier"
  type        = string
}
variable "apigatewayv2_route_api_key_required" {
  description = "(Optional) Whether an API key is required for the route. Defaults to false. Supported only for WebSocket APIs"
  type        = bool
  default     = false
}
variable "apigatewayv2_route_authorization_scopes" {
  description = "(Optional) Authorization scopes supported by this route. The scopes are used with a JWT authorizer to authorize the method invocation"
  type        = list(string)
  default     = null
}
variable "apigatewayv2_route_authorization_type" {
  description = "(Optional) Authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer. For HTTP APIs, valid values are NONE for open access, JWT for using JSON Web Tokens, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer. Defaults to NONE"
  type        = string
  default     = null
}
variable "apigatewayv2_route_authorizer_id" {
  description = "(Optional) Identifier of the aws_apigatewayv2_authorizer resource to be associated with this route"
  type        = string
  default     = null
}
variable "apigatewayv2_route_model_selection_expression" {
  description = "(Optional) Model selection expression for the route. Supported only for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_route_operation_name" {
  description = "(Optional) Operation name for the route. Must be between 1 and 64 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_route_request_models" {
  description = "(Optional) Request models for the route. Supported only for WebSocket APIs"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_route_route_key" {
  description = "(Required) Route key for the route. For HTTP APIs, the route key can be either $default, or a combination of an HTTP method and resource path, for example, GET /pets"
  type        = string
}
variable "apigatewayv2_route_route_response_selection_expression" {
  description = "(Optional) Route response selection expression for the route. Supported only for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_route_target" {
  description = "(Optional) Target for the route, of the form integrations/IntegrationID, where IntegrationID is the identifier of an aws_apigatewayv2_integration resource"
  type        = string
  default     = null
}
variable "apigatewayv2_route_request_parameter" {
  description = "(Optional) Request parameters for the route. Supported only for WebSocket APIs"
  type        = list(object({
    request_parameter_key = string
    required              = bool
  }))
  default = []
}
