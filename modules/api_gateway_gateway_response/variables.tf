variable "api_gateway_gateway_response_response_parameters" {
  description = "Map of parameters (paths, query strings and headers) of the Gateway Response"
  type        = map(string)
  default     = {}
}
variable "api_gateway_gateway_response_response_templates" {
  description = "Map of templates used to transform the response body"
  type        = map(string)
  default     = {}
}
variable "api_gateway_gateway_response_response_type" {
  description = "Response type of the associated GatewayResponse"
  type        = string
}
variable "api_gateway_gateway_response_rest_api_id" {
  description = "String identifier of the associated REST API"
  type        = string
}
variable "api_gateway_gateway_response_status_code" {
  description = "HTTP status code of the Gateway Response"
  type        = string
  default     = ""
}
