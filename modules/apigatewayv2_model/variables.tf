variable "apigatewayv2_model_api_id" {
  description = "(Required) API identifier"
  type        = string
}
variable "apigatewayv2_model_content_type" {
  description = "(Required) Content-type for the model, for example, application/json. Must be between 1 and 256 characters in length"
  type        = string
}
variable "apigatewayv2_model_description" {
  description = "(Optional) Description of the model. Must be between 1 and 128 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_model_name" {
  description = "(Required) Name of the model. Must be alphanumeric. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_model_schema" {
  description = "(Required) Schema for the model. This should be a JSON schema draft 4 model. Must be less than or equal to 32768 characters in length"
  type        = string
}
