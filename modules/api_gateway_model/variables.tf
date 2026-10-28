variable "api_gateway_model_content_type" {
  description = "(Required) Content type of the model"
  type        = string
}
variable "api_gateway_model_description" {
  description = "(Optional) Description of the model"
  type        = string
  default     = null
}
variable "api_gateway_model_name" {
  description = "(Required) Name of the model"
  type        = string
}
variable "api_gateway_model_rest_api_id" {
  description = "(Required) ID of the associated REST API"
  type        = string
}
variable "api_gateway_model_schema" {
  description = "(Optional) Schema of the model in a JSON form"
  type        = string
  default     = null
}
