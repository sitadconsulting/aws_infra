variable "appsync_datasource_api_id" {
  description = "(Required) API ID for the GraphQL API for the data source"
  type        = string
}
variable "appsync_datasource_description" {
  description = "(Optional) Description of the data source"
  type        = string
  default     = null
}
variable "appsync_datasource_name" {
  description = "(Required) User-supplied name for the data source"
  type        = string
}
variable "appsync_datasource_service_role_arn" {
  description = "(Optional) IAM service role ARN for the data source. Required if type is specified as AWS_LAMBDA, AMAZON_DYNAMODB, AMAZON_ELASTICSEARCH, AMAZON_EVENTBRIDGE, or AMAZON_OPENSEARCH_SERVICE"
  type        = string
  default     = null
}
variable "appsync_datasource_type" {
  description = "(Required) Type of the Data Source. Valid values: AWS_LAMBDA, AMAZON_DYNAMODB, AMAZON_ELASTICSEARCH, HTTP, NONE, RELATIONAL_DATABASE, AMAZON_EVENTBRIDGE, AMAZON_OPENSEARCH_SERVICE"
  type        = string
}
variable "appsync_datasource_dynamodb_config" {
  description = "(Optional) DynamoDB settings"
  type        = list(object({
    region                 = optional(string)
    table_name             = string
    use_caller_credentials = optional(bool)
    versioned              = optional(bool)
    delta_sync_config      = optional(list(object({
      base_table_ttl        = optional(number)
      delta_sync_table_name = string
      delta_sync_table_ttl  = optional(number)
    })), []) 
  }))
  default     = []
}
variable "appsync_datasource_elasticsearch_config" {
  description = "(Optional) Amazon Elasticsearch settings"
  type        = list(object({
    endpoint = string
    region   = optional(string)
  }))
  default     = []
}
variable "appsync_datasource_event_bridge_config" {
  description = "(Optional) AWS EventBridge settings"
  type        = list(object({
    event_bus_arn = string
  }))
  default     = []
}
variable "appsync_datasource_http_config" {
  description = "(Optional) HTTP settings"
  type        = list(object({
    endpoint             = string
    authorization_config = optional(list(object({
      authorization_type = optional(string)
      aws_iam_config     = optional(list(object({
        signing_region       = optional(string)
        signing_service_name = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "appsync_datasource_lambda_config" {
  description = "(Optional) AWS Lambda settings"
  type        = list(object({
    function_arn = string
  }))
  default     = []
}
variable "appsync_datasource_opensearchservice_config" {
  description = "(Optional) Amazon OpenSearch Service settings"
  type        = list(object({
    endpoint = string
    region   = optional(string)
  }))
  default     = []
}
variable "appsync_datasource_relational_database_config" {
  description = "(Optional) AWS RDS settings"
  type        = list(object({
    source_type          = optional(string) 
    http_endpoint_config = optional(list(object({
      aws_secret_store_arn  = string
      database_name         = optional(string)
      db_cluster_identifier = string
      region                = optional(string)
      schema                = optional(string)
    })), [])
  }))
  default     = []
}
