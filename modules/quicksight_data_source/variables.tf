variable "quicksight_data_source_aws_account_id" {
  description = "The ID for the AWS account that the data source is in. Currently, you use the ID for the AWS account that contains your Amazon QuickSight account"
  type        = string
  default     = ""
}
variable "quicksight_data_source_data_source_id" {
  description = "An identifier for the data source"
  type        = string
}
variable "quicksight_data_source_name" {
  description = "A name for the data source, maximum of 128 characters"
  type        = string
}
variable "quicksight_data_source_tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "quicksight_data_source_type" {
  description = "The type of the data source"
  type        = string
}
variable "quicksight_data_source_credentials" {
  description = "The credentials Amazon QuickSight uses to connect to your underlying source. Currently, only credentials based on user name and password are supported"
  type        = string
  default     = ""
}
variable "quicksight_data_source_parameters" {
  description = "The parameters used to connect to this data source (exactly one)"
  type        = list(object({
    amazon_elasticsearch  = optional(list(object({
      domain      = string
    })))
    athena                = optional(list(object({
      work_group  = optional(string) 
    })))
    aurora                = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    aurora_postgresql     = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    aws_iot_analytics     = optional(list(object({
      data_set_name = string
    })))
    jira                  = optional(list(object({
      site_base_url = string
    })))
    maria_db              = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    mysql                 = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    oracle                = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    postgresql            = optional(list(object({
      database    = string
      host        = string
      port        = number
    })))
    presto                = optional(list(object({
      catalog     = string
      host        = string
      port        = number
    })))
    rds                   = optional(list(object({
      database    = string
      instance_id = string
    })))
    redshift              = optional(list(object({
      cluster_id  = optional(string)
      database    = string
      host        = optional(string)
      port        = optional(number)
    })))
    s3                    = optional(list(object({
      manifest_file_location = list(object({
        bucket = string
        key    = string
      }))
    })))
    service_now           = optional(list(object({
      site_base_url = string
    })))
    snowflake             = optional(list(object({
      database  = string
      host      = string
      warehouse = string
    })))
    spark                 = optional(list(object({
      host      = string
      port      = number
    })))
    sql_server            = optional(list(object({
      database = string
      host     = string
      port     = number
    })))
    teradata              = optional(list(object({
      database = string
      host     = string
      port     = number
    })))
    twitter               = optional(list(object({
      max_rows = number
      query    = string
    })))
  }))
}
variable "quicksight_data_source_permission" {
  description = "A set of resource permissions on the data source. Maximum of 64 items"
  type        = list(object({
    actions   = list(string)
    principal = string
  }))
  default     = []
}
variable "quicksight_data_source_ssl_properties" {
  description = " Secure Socket Layer (SSL) properties that apply when Amazon QuickSight connects to your underlying source"
  type        = list(object({
    disable_ssl = bool
  }))
  default     = []
}
variable "quicksight_data_source_vpc_connection_properties" {
  description = "Configuration for allowing connection to Amazon Quicksight underlying data sources through a VPC Connection"
  type        = list(object({
    vpc_connection_arn = string
  }))
  default = []
}
