variable "apigatewayv2_integration_response_api_id" {
  description = "(Required) API identifier"
  type        = string
}
variable "apigatewayv2_integration_response_content_handling_strategy" {
  description = "(Optional) How to handle response payload content type conversions. Valid values: CONVERT_TO_BINARY, CONVERT_TO_TEXT"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_response_integration_id" {
  description = "(Required) Identifier of the aws_apigatewayv2_integration"
  type        = string
}
variable "apigatewayv2_integration_response_integration_response_key" {
  description = "(Required) Integration response key"
  type        = string
}
variable "apigatewayv2_integration_response_response_templates" {
  description = "(Optional) Map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_integration_response_template_selection_expression" {
  description = "(Optional) Template selection expression for the integration response"
  type        = string
  default     = null
}
