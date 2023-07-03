variable "glue_crawler_classifiers" {
  description = "List of custom classifiers. By default, all AWS classifiers are included in a crawl, but these custom classifiers always override the default classifiers for a given classification"
  type        = string
  default     = ""
}
variable "glue_crawler_configuration" {
  description = "JSON string of configuration information"
  type        = string
  default     = ""
}
variable "glue_crawler_database_name" {
  description = "Glue database where results are written"
  type        = string
}
variable "glue_crawler_description" {
  description = "Description of the crawler"
  type        = string
  default     = ""
}
variable "glue_crawler_name" {
  description = "Name of the crawler"
  type        = string
}
variable "glue_crawler_role" {
  description = "The IAM role friendly name (including path without leading slash), or ARN of an IAM role, used by the crawler to access other resources"
  type        = string
}
variable "glue_crawler_schedule" {
  description = "A cron expression used to specify the schedule"
  type        = string
  default     = ""
}
variable "glue_crawler_security_configuration" {
  description = "The name of Security Configuration to be used by the crawler"
  type        = string
  default     = ""
}
variable "glue_crawler_table_prefix" {
  description = "The table prefix used for catalog tables that are created"
  type        = string
  default     = ""
}
variable "glue_crawler_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "glue_crawler_catalog_target" {
  description = "Catalog target arguments"
  type        = list(object({
    connection_name     = optional(string)
    database_name       = string
    dlq_event_queue_arn = optional(string)
    event_queue_arn     = optional(string)
    tables              = list(string)
  }))
  default     = []
}
variable "glue_crawler_delta_target" {
  description = "Delta target arguments"
  type        = list(object({
    connection_name           = optional(string)
    create_native_delta_table = optional(bool)
    delta_tables              = list(string)
    write_manifest            = bool
  }))
  default     = []
}
variable "glue_crawler_dynamodb_target" {
  description = "Dynamodb target arguments"
  type        = list(object({
    path      = string
    scan_all  = optional(bool)
    scan_rate = optional(number)
  }))
  default     = []
}
variable "glue_crawler_jdbc_target" {
  description = "Jdbc target arguments"
  type        = list(object({
    connection_name            = string
    enable_additional_metadata = optional(list(string))
    exclusions                 = optional(list(string))
    path                       = string
  }))
  default     = []
}
variable "glue_crawler_lake_formation_configuration" {
  description = "Specifies Lake Formation configuration settings for the crawler"
  type        = list(object({
    account_id                     = optional(string)
    use_lake_formation_credentials = optional(bool)
  }))
  default     = []
}
variable "glue_crawler_lineage_configuration" {
  description = "Specifies data lineage configuration settings for the crawler"
  type        = list(object({
    crawler_lineage_settings = optional(list(string))
  }))
  default     = []
}
variable "glue_crawler_mongodb_target" {
  description = "MongoDB target arguments"
  type        = list(object({
    connection_name = string
    path            = string
    scan_all        = optional(bool)
  }))
  default     = []
}
variable "glue_crawler_recrawl_policy" {
  description = "A policy that specifies whether to crawl the entire dataset again, or to crawl only folders that were added since the last crawler run"
  type        = list(object({
    recrawl_behavior = optional(string)
  }))
  default     = []
}
variable "glue_crawler_s3_target" {
  description = "S3 target arguments"
  type        = list(object({
    connection_name     = optional(string)
    dlq_event_queue_arn = optional(string)
    event_queue_arn     = optional(string)
    exclusions          = optional(list(string))
    path                = string
    sample_size         = optional(number)
  }))
  default     = []
}
variable "glue_crawler_schema_change_policy" {
  description = "Policy for the crawler's update and deletion behavior"
  type        = list(object({
    delete_behavior = optional(string)
    update_behavior = optional(string)
  }))
  default     = []
}
