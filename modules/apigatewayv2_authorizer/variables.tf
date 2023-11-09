variable "apigatewayv2_authorizer_api_id" {
  description = "API identifier"
  type        =  string
}
variable "apigatewayv2_authorizer_authorizer_credentials_arn" {
  description = "Required credentials as an IAM role for API Gateway to invoke the authorizer. Supported only for REQUEST authorizers"
  type        = string
  default     = ""
}
variable "apigatewayv2_authorizer_authorizer_payload_format_version" {
  description = "Format of the payload sent to an HTTP API Lambda authorizer. Required for HTTP API Lambda authorizers. Valid values: 1.0, 2.0"
  type        = string
  default     = ""
}
variable "apigatewayv2_authorizer_authorizer_result_ttl_in_seconds" {
  description = "Time to live (TTL) for cached authorizer results, in seconds. If it equals 0, authorization caching is disabled. If it is greater than 0, API Gateway caches authorizer responses. The maximum value is 3600, or 1 hour. Defaults to 300. Supported only for HTTP API Lambda authorizers"
  type        = number
  default     = 1800
}
variable "apigatewayv2_authorizer_authorizer_type" {
  description = "Authorizer type. Valid values: JWT, REQUEST. Specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Token"
  type        = string
}
variable "apigatewayv2_authorizer_authorizer_uri" {
  description = "Authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers this must be a well-formed Lambda function URI, such as the invoke_arn attribute of the aws_lambda_function resource. Supported only for REQUEST authorizers. Must be between 1 and 2048 characters in length"
  type        = string
  default     = ""
}
variable "apigatewayv2_authorizer_enable_simple_responses" {
  description = "Whether a Lambda authorizer returns a response in a simple format. If enabled, the Lambda authorizer can return a boolean value instead of an IAM policy. Supported only for HTTP APIs"
  type        = bool
  default     = false
}
variable "apigatewayv2_authorizer_identity_sources" {
  description = "Identity sources for which authorization is requested. For REQUEST authorizers the value is a list of one or more mapping expressions of the specified request parameters. For JWT authorizers the single entry specifies where to extract the JSON Web Token (JWT) from inbound requests"
  type        = list(string)
  default     = []
}
variable "apigatewayv2_authorizer_name" {
  description = "Name of the authorizer. Must be between 1 and 128 characters in length"
  type        = string
}
variable "apigatewayv2_authorizer_jwt_configuration" {
  description = "Configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs"
  type        = list(object({
    audience = optional(list(string))
    issuer   = optional(string) 
  }))
  default     = []
}
