variable "api_gateway_method_response_http_method" {
  description = "(Required) HTTP verb of the method resource (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
}
variable "api_gateway_method_response_resource_id" {
  description = "(Required) Resource identifier for the method resource"
  type        = string
}
variable "api_gateway_method_response_response_models" {
  description = "(Optional) Map specifying the model resources used for the response's content type. Response models are represented as a key/value map, with a content type as the key and a Model name as the value"
  type        = map(string)
  default     = {}
}
variable "api_gateway_method_response_response_parameters" {
  description = "(Optional) Map specifying required or optional response parameters that API Gateway can send back to the caller. A key defines a method response header name and the associated value is a boolean flag indicating whether the method response parameter is required. The method response header names must match the pattern of method.response.header.{name}, where name is a valid and unique header name. The response parameter names defined here are available in the integration response to be mapped from an integration response header expressed in integration.response.header.{name}, a static value enclosed within a pair of single quotes (e.g., 'application/json'), or a JSON expression from the back-end response payload in the form of integration.response.body.{JSON-expression}, where JSON-expression is a valid JSON expression without the $ prefix.)"
  type        = map(bool)
  default     = {}
}
variable "api_gateway_method_response_rest_api_id" {
  description = "(Required) String identifier of the associated REST API"
  type        = string
}
variable "api_gateway_method_response_status_code" {
  description = "(Required) Method response's status code"
  type        = string
}
