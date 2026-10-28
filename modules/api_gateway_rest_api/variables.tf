variable "api_gateway_rest_api_api_key_source" {
  description = "(Optional) Source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-api-key-source extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_binary_media_types" {
  description = "(Optional) List of binary media types supported by the REST API. By default, the REST API supports only UTF-8-encoded text payloads. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-binary-media-types extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = list(string)
  default     = null
}
variable "api_gateway_rest_api_body" {
  description = "(Optional) OpenAPI specification that defines the set of routes and integrations to create as part of the REST API. This configuration, and any updates to it, will replace all REST API configuration except values overridden in this resource configuration and other resource updates applied after this resource but before any aws_api_gateway_deployment creation. More information about REST API OpenAPI support can be found in the API Gateway Developer Guide"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_description" {
  description = "(Optional) Description of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.description field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_disable_execute_api_endpoint" {
  description = "(Optional) Whether clients can invoke your API by using the default execute-api endpoint. By default, clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke your API, disable the default endpoint. Defaults to false. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-endpoint-configuration extension disableExecuteApiEndpoint property. If the argument value is true and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = bool
  default     = false
}
variable "api_gateway_rest_api_endpoint_access_mode" {
  description = "(Optional) Endpoint access mode for the REST API. Valid values are BASIC and STRICT. Only available for REST APIs that use a security_policy value beginning with SecurityPolicy_ and is required when one of those values is configured"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_fail_on_warnings" {
  description = "(Optional) Whether to return an error for warnings while API Gateway is creating or updating the resource. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_rest_api_minimum_compression_size" {
  description = "(Optional) Minimum response size to compress for the REST API. String containing an integer value between -1 and 10485760 (10MB). -1 will disable an existing compression configuration, and all other values will enable compression with the configured size. New resources can simply omit this argument to disable compression, rather than setting the value to -1. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-minimum-compression-size extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = number
  default     = null
}
variable "api_gateway_rest_api_name" {
  description = "(Required) Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.title field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
}
variable "api_gateway_rest_api_parameters" {
  description = "(Optional) Map of customizations for importing the specification in the body argument. For example, to exclude DocumentationParts from an imported API, set ignore equal to documentation. Additional documentation, including other parameters such as basepath, can be found in the API Gateway Developer Guide"
  type        = map(string)
  default     = {}
}
variable "api_gateway_rest_api_policy" {
  description = "(Optional) JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Terraform will only perform drift detection of its value when present in a configuration. We recommend using the aws_api_gateway_rest_api_policy resource instead. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-policy extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_put_rest_api_mode" {
  description = "(Optional) Mode of the PutRestApi operation when importing an OpenAPI specification via the body argument (create or update operation). Valid values are merge and overwrite. If not configured, defaults to overwrite (for backwards compatibility). This corresponds to the x-amazon-apigateway-put-integration-method extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_security_policy" {
  description = "(Optional) TLS version + cipher suite for the REST API's default execute-api endpoint. Must be configured for drift detection. When set to a value beginning with SecurityPolicy_, endpoint_access_mode must also be configured. For a list of valid security policies, see CreateRestApi in the Amazon API Gateway API Reference"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "api_gateway_rest_api_endpoint_configuration" {
  description = "(Optional) Configuration block defining API endpoint configuration including endpoint type"
  type        = list(object({
    ip_address_type  = optional(string)
    types            = list(string)
    vpc_endpoint_ids = optional(list(string))
  }))
  default     = []
}
