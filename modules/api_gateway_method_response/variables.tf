variable "api_gateway_method_response_http_method" {
  description = "HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
}
variable "api_gateway_method_response_resource_id" {
  description = "API resource ID"
  type        = string
}
variable "api_gateway_method_response_response_models" {
  description = "Map of the API models used for the response's content type"
  type        = map(string)
  default     = {}
}
variable "api_gateway_method_response_response_parameters" {
  description = "Map of response parameters that can be sent to the caller. For example: response_parameters = { "method.response.header.X-Some-Header" = true } would define that the header X-Some-Header can be provided on the response"
  type        = map(bool)
  default     = {}
}
variable "api_gateway_method_response_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_method_response_status_code" {
  description = "HTTP status code"
  type        = string
}
