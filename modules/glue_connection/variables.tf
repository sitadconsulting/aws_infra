variable "glue_connection_athena_properties" {
  description = "(Optional) Map of key-value pairs used as connection properties specific to the Athena compute environment"
  type        = map(string)
  default     = {}
}
variable "glue_connection_catalog_id" {
  description = "The ID of the Data Catalog in which to create the connection. If none is supplied, the AWS account ID is used by default"
  type        = string
  default     = null
}
variable "glue_connection_connection_properties" {
  description = "A map of key-value pairs used as parameters for this connection"
  type        = map(string)
  default     = {}
}
variable "glue_connection_connection_type" {
  description = "(Optional) Type of the connection. Valid values: AZURECOSMOS, AZURESQL, BIGQUERY, CUSTOM, DYNAMODB, JDBC, KAFKA, MARKETPLACE, MONGODB, NETWORK, OPENSEARCH, SNOWFLAKE. Defaults to JDBC. Some connection types require the SparkProperties property with a JSON document that contains the actual connection properties"
  type        = string
  default     = null
}
variable "glue_connection_description" {
  description = "Description of the connection"
  type        = string
  default     = null
}
variable "glue_connection_match_criteria" {
  description = "A list of criteria that can be used in selecting this connection"
  type        = list(string)
  default     = []
}
variable "glue_connection_name" {
  description = "The name of the connection"
  type        = string
}
variable "glue_connection_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_connection_authentication_configuration" {
  description = "Optional) Configuration block for authentication options"
  type        = list(object({
    authentication_type               = string
    custom_authentication_credentials = optional(map(string))
    kms_key_arn                       = optional(string)
    secret_arn                        = optional(string)
    basic_authentication_credentials  = optional(list(object({
      password = string
      username = string
    })), [])
    oauth2_properties                 = optional(list(object({
      oauth2_grant_type             = optional(string)
      token_url                     = optional(string)
      token_url_parameters_map      = optional(map(string))
      authorization_code_properties = optional(list(object({
        authorization_code = string
        redirect_uri       = string
      })), [])
      oauth2_client_application     = optional(list(object({
        aws_managed_client_application_reference  = optional(string)
        user_managed_client_application_client_id = optional(string)
      })), [])
      oauth2_credentials            = optional(list(object({
        access_token                                  = optional(string)
        jwt_token                                     = optional(string)
        refresh_token                                 = optional(string)
        user_managed_client_application_client_secret = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "glue_connection_physical_connection_requirements" {
  description = "A map of physical connection requirements, such as VPC and SecurityGroup"
  type        = list(object({
    availability_zone      = optional(string)
    security_group_id_list = optional(list(string))
    subnet_id              = optional(string)
  }))
  default     = []
}
