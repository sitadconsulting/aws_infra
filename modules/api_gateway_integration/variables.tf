variable "api_gateway_integration_cache_key_parameters" {
  description = "List of cache key parameters for the integration"
  type        = list(string)
  default     = []
}
variable "api_gateway_integration_cache_namespace" {
  description = "ntegration's cache namespace"
  type        = string
  default     = ""
}
variable "api_gateway_integration_connection_id" {
  description = "ID of the VpcLink used for the integration. Required if connection_type is VPC_LINK"
  type        = string
  default     = null
}
variable "api_gateway_integration_connection_type" {
  description = "Integration input's connectionType. Valid values are INTERNET (default for connections through the public routable internet), and VPC_LINK (for private connections between API Gateway and a network load balancer in a VPC)"
  type        = string
  default     = null
}
variable "api_gateway_integration_content_handling" {
  description = "How to handle request payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT. If this property is not defined, the request payload will be passed through from the method request to integration request without modification, provided that the passthroughBehaviors is configured to support payload pass-through"
  type        = string
  default     = null
}
variable "api_gateway_integration_credentials" {
  description = "Credentials required for the integration. For AWS integrations, 2 options are available. To specify an IAM Role for Amazon API Gateway to assume, use the role's ARN. To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::\*:user/\*"
  type        = string
  default     = null
}
variable "api_gateway_integration_http_method" {
  description = "HTTP method (GET, POST, PUT, DELETE, HEAD, OPTION, ANY) when calling the associated resource"
  type        = string
  default     = null
}
variable "api_gateway_integration_integration_http_method" {
  description = "Integration HTTP method (GET, POST, PUT, DELETE, HEAD, OPTIONs, ANY, PATCH) specifying how API Gateway will interact with the back end. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. Not all methods are compatible with all AWS integrations. e.g., Lambda function can only be invoked via POST"
  type        = string
  default     = null
}
variable "api_gateway_integration_passthrough_behavior" {
  description = "Integration passthrough behavior (WHEN_NO_MATCH, WHEN_NO_TEMPLATES, NEVER). Required if request_templates is used"
  type        = string
  default     = null
}
variable "api_gateway_integration_request_parameters" {
  description = "Map of request query string parameters and headers that should be passed to the backend responder. For example: request_parameters = { \"integration.request.header.X-Some-Other-Header" = "method.request.header.X-Some-Header\"}"
  type        = map(string)
  default     = {}
}
variable "api_gateway_integration_request_templates" {
  description = "Map of the integration's request templates"
  type        = map(string)
  default     = {}
}
variable "api_gateway_integration_resource_id" {
  description = "API resource ID"
  type        = string
}
variable "api_gateway_integration_rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}
variable "api_gateway_integration_timeout_milliseconds" {
  description = "Custom timeout between 50 and 29,000 milliseconds. The default value is 29,000 milliseconds"
  type        = number
  default     = 29000
}
variable "api_gateway_integration_type" {
  description = "Integration input's type. Valid values are HTTP (for HTTP backends), MOCK (not calling any real backend), AWS (for AWS services), AWS_PROXY (for Lambda proxy integration) and HTTP_PROXY (for HTTP proxy integration). An HTTP or HTTP_PROXY integration with a connection_type of VPC_LINK is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC"
  type        = string
  default     = null
}
variable "api_gateway_integration_uri" {
  description = "Input's URI. Required if type is AWS, AWS_PROXY, HTTP or HTTP_PROXY. For HTTP integrations, the URI must be a fully formed, encoded HTTP(S) URL according to the RFC-3986 specification . For AWS integrations, the URI should be of the form arn:aws:apigateway:{region}:{subdomain.service|service}:{path|action}/{service_api}. region, subdomain and service are used to determine the right endpoint. e.g., arn:aws:apigateway:eu-west-1:lambda:path/2015-03-31/functions/arn:aws:lambda:eu-west-1:012345678901:function:my-func/invocations. For private integrations, the URI parameter is not used for routing requests to your endpoint, but is used for setting the Host header and for certificate validation"
  type        = string
  default     = null
}
variable "api_gateway_integration_tls_config" {
  description = "TLS configuration"
  type        = list(object({
    insecure_skip_verification = optional(bool)
  }))
  default     = []
}
