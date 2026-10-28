variable "apigatewayv2_route_response_api_id" {
  description = "(Required) API identifier"
  type        = string
}
variable "apigatewayv2_route_response_model_selection_expression" {
  description = "(Optional) Model selection expression for the route response"
  type        = string
  default     = null
}
variable "apigatewayv2_route_response_response_models" {
  description = "(Optional) Response models for the route response"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_route_response_route_id" {
  description = "(Required) Identifier of the aws_apigatewayv2_route"
  type        = string
}
variable "apigatewayv2_route_response_route_response_key" {
  description = "(Required) Route response key"
  type        = string
}
