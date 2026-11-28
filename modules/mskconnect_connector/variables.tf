variable "mskconnect_connector_connector_configuration" {
  description = "(Required) Map of keys to values that represent the configuration for the connector"
  type        = map(string)
}
variable "mskconnect_connector_description" {
  description = "(Optional) Summary description of the connector"
  type        = string
  default     = null
}
variable "mskconnect_connector_kafkaconnect_version" {
  description = "(Required) Version of Kafka Connect. It has to be compatible with both the Apache Kafka cluster's version and the plugins"
  type        = string
}
variable "mskconnect_connector_name" {
  description = "(Required) Name of the connector"
  type        = string
}
variable "mskconnect_connector_service_execution_role_arn" {
  description = "(Required) ARN of the IAM role used by the connector to access the Amazon Web Services resources that it needs. The types of resources depends on the logic of the connector. For example, a connector that has Amazon S3 as a destination must have permissions that allow it to write to the S3 destination bucket"
  type        = string
}
variable "mskconnect_connector_capacity" {
  description = "(Required) Information about the capacity allocated to the connector"
  type        = list(object({
    autoscaling = optional(list(object({
      max_worker_count = number
      mcu_count        = optional(number)
      min_worker_count = number
      scale_in_policy  = optional(list(object({
        cpu_utilization_percentage = optional(number)
      })), [])
      scale_out_policy = optional(list(object({
        cpu_utilization_percentage = optional(number)
      })), [])
    })), [])
    provisioned_capacity = optional(list(object({
      mcu_count    = optional(number)
      worker_count = number
    })), [])
  }))
}
variable "mskconnect_connector_kafka_cluster" {
  description = "(Required) Apache Kafka cluster to connect to"
  type        = list(object({
    apache_kafka_cluster = list(object({
      bootstrap_servers = string
      vpc               = list(object({
        security_groups = list(string)
        subnets         = list(string)
      }))
    }))
  }))
}
variable "mskconnect_connector_kafka_cluster_client_authentication" {
  description = "(Required) Details of the client authentication used by the Apache Kafka cluster"
  type        = list(object({
    authentication_type = optional(string)
  }))
}
variable "mskconnect_connector_kafka_cluster_encryption_in_transit" {
  description = "(Required) Details of encryption in transit to the Apache Kafka cluster"
  type        = list(object({
    encryption_type = optional(string)
  }))
}
variable "mskconnect_connector_log_delivery" {
  description = "(Optional) Details about log delivery"
  type        = list(object({
    worker_log_delivery = list(object({
      cloudwatch_logs = optional(list(object({
        enabled   = bool
        log_group = optional(string)
      })), [])
      firehose        = optional(list(object({
        delivery_stream = optional(string)
        enabled         = bool
      })), [])
      s3              = optional(list(object({
        bucket  = optional(string)
        enabled = bool
        prefix  = optional(string)
      })), [])
    }))
  }))
  default     = []
}
variable "mskconnect_connector_plugin" {
  description = "(Required) Plugins to use for the connector"
  type        = list(object({
    custom_plugin = list(object({
      arn      = string
      revision = number
    }))
  }))
}
variable "mskconnect_connector_worker_configuration" {
  description = "(Optional) Worker configuration to use with the connector"
  type        = list(object({
    arn      = string
    revision = number
  }))
  default     = []
}
