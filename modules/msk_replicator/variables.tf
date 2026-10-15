variable "msk_replicator_description" {
  description = "(Optional) A summary description of the replicator"
  type        = string
  default     = null
}
variable "msk_replicator_replicator_name" {
  description = "(Required) The name of the replicator"
  type        = string
}
variable "msk_replicator_service_execution_role_arn" {
  description = "(Required) The ARN of the IAM role used by the replicator to access resources in the customer's account (e.g source and target clusters)"
  type        = string
}
variable "msk_replicator_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "msk_replicator_kafka_cluster" {
  description = "(Required) The source and target Kafka clusters for the replicator. Exactly two blocks are required"
  type        = list(object({
    amazon_msk_cluster    = optional(list(object({
      msk_cluster_arn = string
    })), [])
    apache_kafka_cluster  = optional(list(object({
      apache_kafka_cluster_id = string
      bootstrap_broker_string = string
    })), [])
    client_authentication = optional(list(object({
      mtls       = optional(list(object({
        secret_arn = string
      })), []) 
      sasl_scram = optional(list(object({
        mechanism  = string
        secret_arn = string
      })), [])
    })), [])
    encryption_in_transit = optional(list(object({
      root_ca_certificate = string
    })), [])
    vpc_config            = optional(list(object({
      subnet_ids          = list(string)
      security_groups_ids = list(string)
    })), [])
  }))
}
variable "msk_replicator_log_delivery" {
  description = "(Optional) Configuration block for delivering replicator logs to customer destinations"
  type        = list(object({
    replicator_log_delivery = optional(list(object({
      cloudwatch_logs = optional(list(object({
        enabled   = bool
        log_group = optional(string)
      })), [])
      firehose        = optional(list(object({
        enabled         = bool
        delivery_stream = optional(string)
      })), [])
      s3              = optional(list(object({
        enabled = bool
        bucket  = optional(string)
        prefix  = optional(string)
      })), [])
    })), [])
  }))
  default     = []
}
variable "msk_replicator_replication_info_list" {
  description = "(Required) A list of replication configurations, where each configuration targets a given source cluster to target cluster replication flow "
  type        = list(object({
    source_kafka_cluster_arn = optional(string)
    source_kafka_cluster_id  = optional(string)
    target_kafka_cluster_arn = optional(string)
    target_kafka_cluster_id  = optional(string)
    target_compression_type  = string
    topic_replication        = list(object({
      topics_to_replicate                  = list(string) 
      topics_to_exclude                    = optional(list(string))
      detect_and_copy_new_topics           = optional(bool)
      copy_access_control_lists_for_topics = optional(bool)
      copy_topic_configurations            = optional(bool)
      topic_name_configuration             = optional(list(object({
        type = optional(string)
      })), [])
      starting_position                    = optional(list(object({
        type = optional(string)
      })), []) 
    }))
    consumer_group_replication = list(object({
      consumer_groups_to_replicate        = list(string)
      consumer_group_offset_sync_mode     = optional(string)
      consumer_groups_to_exclude          = optional(list(string))
      detect_and_copy_new_consumer_groups = optional(bool)
      synchronise_consumer_group_offsets  = optional(bool)
    }))
  }))
}
