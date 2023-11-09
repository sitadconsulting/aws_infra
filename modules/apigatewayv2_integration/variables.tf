variable "apigatewayv2_integration_api_id" {
  description = "API identifier"
  type        = string
}
variable "apigatewayv2_integration_connection_id" {
  description = "ID of the VPC link for a private integration. Supported only for HTTP APIs. Must be between 1 and 1024 characters in length"
  type        = string
  default     = ""
}
variable "apigatewayv2_integration_connection_type" {
  description = "Type of the network connection to the integration endpoint. Valid values: INTERNET, VPC_LINK. Default is INTERNET"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_content_handling_strategy" {
  description = "How to handle response payload content type conversions. Valid values: CONVERT_TO_BINARY, CONVERT_TO_TEXT. Supported only for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_credentials_arn" {
  description = "Credentials required for the integration, if any"
  type        = string
  default     = ""
}
variable "apigatewayv2_integration_description" {
  description = "Description of the integration"
  type        = string
  default     = ""
}
variable "apigatewayv2_integration_integration_method" {
  description = "Integration's HTTP method. Must be specified if integration_type is not MOCK"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_integration_subtype" {
  description = "AWS service action to invoke. Supported only for HTTP APIs when integration_type is AWS_PROXY. See the AWS service integration reference documentation for supported values. Must be between 1 and 128 characters in length"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_integration_type" {
  description = "Integration type of an integration. Valid values: AWS (supported only for WebSocket APIs), AWS_PROXY, HTTP (supported only for WebSocket APIs), HTTP_PROXY, MOCK (supported only for WebSocket APIs). For an HTTP API private integration, use HTTP_PROXY"
  type        = string
}
variable "apigatewayv2_integration_integration_uri" {
  description = "URI of the Lambda function for a Lambda proxy integration, when integration_type is AWS_PROXY. For an HTTP integration, specify a fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_passthrough_behavior" {
  description = "Pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the request_templates attribute. Valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER. Default is WHEN_NO_MATCH. Supported only for WebSocket APIs"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_payload_format_version" {
  description = "The format of the payload sent to an integration. Valid values: 1.0, 2.0. Default is 1.0"
  type        = string
  default     = null
}
variable "apigatewayv2_integration_request_parameters" {
  description = "For WebSocket APIs, a key-value map specifying request parameters that are passed from the method request to the backend. For HTTP APIs with a specified integration_subtype, a key-value map specifying parameters that are passed to AWS_PROXY integrations. For HTTP APIs without a specified integration_subtype, a key-value map specifying how to transform HTTP requests before sending them to the backend. See the Amazon API Gateway Developer Guide for details"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_integration_request_templates" {
  description = "Map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. Supported only for WebSocket APIs"
  type        = map(string)
  default     = {}
}
variable "apigatewayv2_integration_template_selection_expression" {
  description = "The template selection expression for the integration"
  type        = string
  default     = ""
}
variable "apigatewayv2_integration_timeout_milliseconds" {
  description = "Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs. Terraform will only perform drift detection of its value when present in a configuration"
  type        = number
  default     = null
}
variable "apigatewayv2_integration_response_parameters" {
  description = "Mappings to transform the HTTP response from a backend integration before returning the response to clients. Supported only for HTTP APIs"
  type        = list(object({
    mappings    = map(string)
    status_code = string
  })) 
  default     = []
}
variable "apigatewayv2_integration_tls_config" {
  description = "TLS configuration for a private integration. Supported only for HTTP APIs"
  type        = list(object({
    server_name_to_verify = optional(string)
  }))
  default     = []
}
