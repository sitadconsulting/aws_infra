variable "api_gateway_integration_response_content_handling" {
  description = " "
  type        =
  default     =
}
variable "api_gateway_integration_response_http_method" {
  description = "HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
}
variable "api_gateway_integration_response_resource_id" {
  description = "API resource ID"
  type        = string
}
variable "api_gateway_integration_response_response_parameters" {
  description = "Map of response parameters that can be read from the backend response. For example: response_parameters = { \"method.response.header.X-Some-Header" = "integration.response.header.X-Some-Other-Header\" }"
  type        = map(string)
  default     = {}
}
variable "api_gateway_integration_response_response_templates" {
  description = "Map of templates used to transform the integration response body"
  type        = map(string)
  default     = {}
}
variable "api_gateway_integration_response_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_integration_response_selection_pattern" {
  description = "Regular expression pattern used to choose an integration response based on the response from the backend. Omit configuring this to make the integration the default one. If the backend is an AWS Lambda function, the AWS Lambda function error header is matched. For all other HTTP and AWS backends, the HTTP status code is matched"
  type        = string
  default     = null
}
variable "api_gateway_integration_response_status_code" {
  description = "HTTP status code"
  type        = string
}
