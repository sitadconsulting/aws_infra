variable "api_gateway_authorizer_authorizer_credentials" {
  description = "Credentials required for the authorizer. To specify an IAM Role for API Gateway to assume, use the IAM Role ARN"
  type        = string
  default     = null
}
variable "api_gateway_authorizer_authorizer_result_ttl_in_seconds" {
  description = "TTL of cached authorizer results in seconds. Defaults to 300"
  type        = number
  default     = 300
}
variable "api_gateway_authorizer_authorizer_uri" {
  description = "Authorizer's Uniform Resource Identifier (URI). This must be a well-formed Lambda function URI in the form of arn:aws:apigateway:{region}:lambda:path/{service_api}, e.g., arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:012345678912:function:my-function/invocations"
  type        = string
  default     = null
}
variable "api_gateway_authorizer_identity_source" {
  description = "Source of the identity in an incoming request. Defaults to method.request.header.Authorization. For REQUEST type, this may be a comma-separated list of values, including headers, query string parameters and stage variables - e.g., \"method.request.header.SomeHeaderName,method.request.querystring.SomeQueryStringName,stageVariables.SomeStageVariableName\""
  type        = string
  default     = null
}
variable "api_gateway_authorizer_identity_validation_expression" {
  description = "Validation expression for the incoming identity. For TOKEN type, this value should be a regular expression. The incoming token from the client is matched against this expression, and will proceed if the token matches. If the token doesn't match, the client receives a 401 Unauthorized response"
  type        = string
  default     = null
}
variable "api_gateway_authorizer_name" {
  description = "Name of the authorizer"
  type        = string
}
variable "api_gateway_authorizer_provider_arns" {
  description = "List of the Amazon Cognito user pool ARNs. Each element is of this format: arn:aws:cognito-idp:{region}:{account_id}:userpool/{user_pool_id}"
  type        = list(string)
  default     = []
}
variable "api_gateway_authorizer_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_authorizer_type" {
  description = "Type of the authorizer. Possible values are TOKEN for a Lambda function using a single authorization token submitted in a custom header, REQUEST for a Lambda function using incoming request parameters, or COGNITO_USER_POOLS for using an Amazon Cognito user pool. Defaults to TOKEN"
  type        = string
  default     = null
}
