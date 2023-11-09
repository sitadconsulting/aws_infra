variable "apigatewayv2_model_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_model_content_type" {
  description = "The content-type for the model, for example, application/json. Must be between 1 and 256 characters in length"
  type        = string
}
variable "apigatewayv2_model_description" {
  description = "Description of the model. Must be between 1 and 128 characters in length"
  type        = string
  default     = ""
}
variable "apigatewayv2_model_name" {
  description = "Name of the model. Must be alphanumeric. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_model_schema" {
  description = "Schema for the model. This should be a JSON schema draft 4 model. Must be less than or equal to 32768 characters in length"
  type        = string
}
