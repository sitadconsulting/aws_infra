variable "api_gateway_model_content_type" {
  description = "Content type of the model"
  type        = string
}
variable "api_gateway_model_description" {
  description = "Description of the model"
  type        = string
  default     = ""
}
variable "api_gateway_model_name" {
  description = "Name of the model"
  type        = string
}
variable "api_gateway_model_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_model_schema" {
  description = "Schema of the model in a JSON form"
  type        = string
}
