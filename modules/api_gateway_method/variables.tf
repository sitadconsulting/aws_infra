variable "api_gateway_method_api_key_required" {
  description = "Specify if the method requires an API key"
  type        = bool
  default     = false
}
variable "api_gateway_method_authorization" {
  description = "Type of authorization used for the method (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)"
  type        = string
}
variable "api_gateway_method_authorization_scopes" {
  description = "Authorization scopes used when the authorization is COGNITO_USER_POOLS"
  type        = list(string)
  default     = null
}
variable "api_gateway_method_authorizer_id" {
  description = "Authorizer id to be used when the authorization is CUSTOM or COGNITO_USER_POOLS"
  type        = string
  default     = null
}
variable "api_gateway_method_http_method" {
  description = "HTTP Method (GET, POST, PUT, DELETE, HEAD, OPTIONS, ANY)"
  type        = string
}
variable "api_gateway_method_operation_name" {
  description = "Function name that will be given to the method when generating an SDK through API Gateway. If omitted, API Gateway will generate a function name based on the resource path and HTTP verb"
  type        = string
  default     = null
}
variable "api_gateway_method_request_models" {
  description = "Map of the API models used for the request's content type where key is the content type (e.g., application/json) and value is either Error, Empty (built-in models) or aws_api_gateway_model's name"
  type        = map(string)
  default     = {}
}
variable "api_gateway_method_request_parameters" {
  description = "Map of request parameters (from the path, query string and headers) that should be passed to the integration. The boolean value indicates whether the parameter is required (true) or optional (false). For example: request_parameters = {\"method.request.header.X-Some-Header\" = true \"method.request.querystring.some-query-param\" = true} would define that the header X-Some-Header and the query string some-query-param must be provided in the request"
  type        = map(bool)
  default     = {}
}
variable "api_gateway_method_request_validator_id" {
  description = "ID of a aws_api_gateway_request_validator"
  type        = string
  default     = null
}
variable "api_gateway_method_resource_id" {
  description = "API resource ID"
  type        = string
}
variable "api_gateway_method_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
