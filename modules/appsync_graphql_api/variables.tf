variable "appsync_graphql_api_api_type" {
  description = "(Optional) API type. Valid values are GRAPHQL or MERGED. A MERGED type requires merged_api_execution_role_arn to be set"
  type        = string
  default     = null
}
variable "appsync_graphql_api_authentication_type" {
  description = "(Required) Authentication type. Valid values: API_KEY, AWS_IAM, AMAZON_COGNITO_USER_POOLS, OPENID_CONNECT, AWS_LAMBDA"
  type        = string
}
variable "appsync_graphql_api_introspection_config" {
  description = "(Optional) Sets the value of the GraphQL API to enable (ENABLED) or disable (DISABLED) introspection. If no value is provided, the introspection configuration will be set to ENABLED by default. This field will produce an error if the operation attempts to use the introspection feature while this field is disabled"
  type        = string
  default     = null
}
variable "appsync_graphql_api_merged_api_execution_role_arn" {
  description = "(Optional) ARN of the execution role when api_type is set to MERGED"
  type        = string
  default     = null
}
variable "appsync_graphql_api_name" {
  description = "(Required) User-supplied name for the GraphQL API"
  type        = string
}
variable "appsync_graphql_api_query_depth_limit" {
  description = "(Optional) Maximum depth a query can have in a single request. Depth refers to the amount of nested levels allowed in the body of query. The default value is 0 (or unspecified), which indicates there's no depth limit. If you set a limit, it can be between 1 and 75 nested levels. This field will produce a limit error if the operation falls out of bounds"
  type        = number
  default     = null
}
variable "appsync_graphql_api_resolver_count_limit" {
  description = "(Optional) Maximum number of resolvers that can be invoked in a single request. The default value is 0 (or unspecified), which will set the limit to 10000. When specified, the limit value can be between 1 and 10000. This field will produce a limit error if the operation falls out of bounds"
  type        = number
  default     = null
}
variable "appsync_graphql_api_schema" {
  description = "(Optional) Schema definition, in GraphQL schema language format. Terraform cannot perform drift detection of this configuration"
  type        = string
  default     = null
}
variable "appsync_graphql_api_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "appsync_graphql_api_visibility" {
  description = "(Optional) Sets the value of the GraphQL API to public (GLOBAL) or private (PRIVATE). If no value is provided, the visibility will be set to GLOBAL by default. This value cannot be changed once the API has been created"
  type        = string
  default     = null
}
variable "appsync_graphql_api_xray_enabled" {
  description = "(Optional) Whether tracing with X-ray is enabled. Defaults to false"
  type        = bool
  default     = false
}
variable "appsync_graphql_api_additional_authentication_provider" {
  description = "(Optional) One or more additional authentication providers for the GraphQL API"
  type        = list(object({
    authentication_type   = string
    lambda_authorizer_config = optional(list(object({
      authorizer_result_ttl_in_seconds = optional(number)
      authorizer_uri                   = string
      identity_validation_expression   = optional(string)
    })), [])
    openid_connect_config    = optional(list(object({
       auth_ttl  = optional(number)
       client_id = optional(string)
       iat_ttl   = optional(number)
       issuer    = string
    })), [])
    user_pool_config         = optional(list(object({
      app_id_client_regex = optional(string)
      aws_region          = optional(string)
      user_pool_id        = string
    })), [])
  }))
  default     = []
}
variable "appsync_graphql_api_enhanced_metrics_config" {
  description = "(Optional) Enables and controls the enhanced metrics feature"
  type        = list(object({
    data_source_level_metrics_behavior = string
    operation_level_metrics_config     = string
    resolver_level_metrics_behavior    = string
  }))
  default     = []
}
variable "appsync_graphql_api_lambda_authorizer_config" {
  description = "(Optional) Nested argument containing Lambda authorizer configuration"
  type        = list(object({
    authorizer_result_ttl_in_seconds = optional(number)
    authorizer_uri                   = string
    identity_validation_expression   = optional(string)
  }))
  default     = []
}
variable "appsync_graphql_api_log_config" {
  description = "(Optional) Nested argument containing logging configuration"
  type        = list(object({
    cloudwatch_logs_role_arn = string
    exclude_verbose_content  = optional(bool)
    field_log_level          = string
  }))
  default     = []
}
variable "appsync_graphql_api_openid_connect_config" {
  description = "(Optional) Nested argument containing OpenID Connect configuration"
  type        = list(object({
    auth_ttl  = optional(number)
    client_id = optional(string)
    iat_ttl   = optional(number)
    issuer    = string
  }))
  default     = []
}
variable "appsync_graphql_api_user_pool_config" {
  description = "(Optional) Amazon Cognito User Pool configuration"
  type        = list(object({
    app_id_client_regex = optional(string)
    aws_region          = optional(string)
    default_action      = string
    user_pool_id        = string
  }))
  default     = []
}
