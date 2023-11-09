variable "apigatewayv2_route_response_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_route_response_model_selection_expression" {
  description = "The model selection expression for the route response"
  type        = string
  default     = null
}
variable "apigatewayv2_route_response_response_models" {
  description = "Response models for the route response"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_route_response_route_id" {
  description = "Identifier of the aws_apigatewayv2_route"
  type        = string
}
variable "apigatewayv2_route_response_route_response_key" {
  description = "Route response key"
  type        = string
}
