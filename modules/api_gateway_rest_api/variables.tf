variable "api_gateway_rest_api_api_key_source" {
  description = "Source of the API key for requests. Valid values are HEADER (default) and AUTHORIZER. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-api-key-source extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_binary_media_types" {
  description = "List of binary media types supported by the REST API. By default, the REST API supports only UTF-8-encoded text payloads. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-binary-media-types extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = list(string)
  default     = []
}
variable "api_gateway_rest_api_body" {
  description = "OpenAPI specification that defines the set of routes and integrations to create as part of the REST API. This configuration, and any updates to it, will replace all REST API configuration except values overridden in this resource configuration and other resource updates applied after this resource but before any aws_api_gateway_deployment creation. More information about REST API OpenAPI support can be found in the API Gateway Developer Guide"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_description" {
  description = "Description of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.description field. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = ""
}
variable "api_gateway_rest_api_disable_execute_api_endpoint" {
  description = "Whether clients can invoke your API by using the default execute-api endpoint. By default, clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com endpoint. To require that clients use a custom domain name to invoke your API, disable the default endpoint. Defaults to false. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-endpoint-configuration extension disableExecuteApiEndpoint property. If the argument value is true and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = bool
  default     = false
}
variable "api_gateway_rest_api_fail_on_warnings" {
  description = "Whether warnings while API Gateway is creating or updating the resource should return an error or not. Defaults to false"
  type        = bool
  default     = false
}
variable "api_gateway_rest_api_minimum_compression_size" {
  description = "Minimum response size to compress for the REST API. String containing an integer value between -1 and 10485760 (10MB). -1 will disable an existing compression configuration, and all other values will enable compression with the configured size. New resources can simply omit this argument to disable compression, rather than setting the value to -1. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-minimum-compression-size extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = number
  default     = null
}
variable "api_gateway_rest_api_name" {
  description = "Name of the REST API. If importing an OpenAPI specification via the body argument, this corresponds to the info.title field. If the argument value is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
}
variable "api_gateway_rest_api_parameters" {
  description = "Map of customizations for importing the specification in the body argument. For example, to exclude DocumentationParts from an imported API, set ignore equal to documentation. Additional documentation, including other parameters such as basepath, can be found in the API Gateway Developer Guide"
  type        = map(string)
  default     = {}
}
variable "api_gateway_rest_api_policy" {
  description = "JSON formatted policy document that controls access to the API Gateway. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Terraform will only perform drift detection of its value when present in a configuration. We recommend using the aws_api_gateway_rest_api_policy resource instead. If importing an OpenAPI specification via the body argument, this corresponds to the x-amazon-apigateway-policy extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_put_rest_api_mode" {
  description = "Mode of the PutRestApi operation when importing an OpenAPI specification via the body argument (create or update operation). Valid values are merge and overwrite. If unspecificed, defaults to overwrite (for backwards compatibility). This corresponds to the x-amazon-apigateway-put-integration-method extension. If the argument value is provided and is different than the OpenAPI value, the argument value will override the OpenAPI value"
  type        = string
  default     = null
}
variable "api_gateway_rest_api_tags" {
  description = " Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "api_gateway_rest_api_endpoint_configuration" {
  description = "Configuration block defining API endpoint configuration including endpoint type"
  type        = list(object({
    types            = list(string)
    vpc_endpoint_ids = optional list(string)
  }))
  default     = []
}
