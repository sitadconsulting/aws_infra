variable "apigatewayv2_integration_response_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_integration_response_content_handling_strategy" {
  description = "How to handle response payload content type conversions. Valid values: CONVERT_TO_BINARY, CONVERT_TO_TEXT"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_response_integration_id" {
  description = "Identifier of the aws_apigatewayv2_integration"
  type        = string
}
variable "apigatewayv2_integration_response_integration_response_key" {
  description = "Integration response key"
  type        = string
}
variable "apigatewayv2_integration_response_response_template" {
  description = "Map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_integration_response_template_selection_expression" {
  description = "The template selection expression for the integration response"
  type        = string
  default     = ""
}
