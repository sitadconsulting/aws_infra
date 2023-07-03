variable "msk_cluster_cluster_name" {
  description = "Name of the MSK cluster"
  type        = string
}
variable "msk_cluster_enhanced_monitoring" {
  description = "Specify the desired enhanced MSK CloudWatch monitoring level"
  type        = string
  default     = ""
}
variable "msk_cluster_kafka_version" {
  description = "Specify the desired Kafka software version"
  type        = string
}
variable "msk_cluster_number_of_broker_nodes" {
  description = "The desired total number of broker nodes in the kafka cluster. It must be a multiple of the number of specified client subnets"
  type        = number
}
variable "msk_cluster_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "msk_cluster_broker_node_group_info" {
  description = "Configuration block for the broker nodes of the Kafka cluster"
  type        = list(object({
    az_distribution   = optional(string)
    client_subnets    = list(string)
    instance_type     = string
    security_groups   = list(string)
    connectivity_info = optional(list(object({
      public_access   = optional(list(object({
        type = optional(string)
      })))
    }))) 
    storage_info      = optional(list(object({
      ebs_storage_info = optional(list(object({
        volume_size            = optional(number) 
        provisioned_throughput = optional(list(object({
          enabled           = optional(bool)
          volume_throughput = optional(number)
        })))
      })))
    })))
  }))
}
variable "msk_cluster_client_authentication" {
  description = "Configuration block for specifying a client authentication"
  type        = list(object({
    unauthenticated = optional(bool)
    sasl      = optional(list(object({
      iam   = optional(bool)
      scram = optional(bool)
    })))
    tls       = optional(list(object({
      certificate_authority_arns = optional(list(string))
    })))
  }))
  default     = []
}
variable "msk_cluster_configuration_info" {
  description = "Configuration block for specifying a MSK Configuration to attach to Kafka brokers"
  type        = list(object({
    arn       = string
    revision  = number
  })) 
  default     = []
}
variable "msk_cluster_encryption_info" {
  description = "Configuration block for specifying encryption"
  type        = list(object({
    encryption_at_rest_kms_key_arn = optional(string)
    encryption_in_transit          = optional(list(object({
      client_broker = optional(string)
      in_cluster    = optional(bool)
    })))
  }))
  default     = []
}
variable "msk_cluster_logging_info" {
  description = "Configuration block for streaming broker logs to Cloudwatch/S3/Kinesis Firehose"
  type        = list(object({
    broker_logs = list(object({
      cloudwatch_logs = optional(list(object({
        enabled   = bool
        log_group = optional(string)
      })))
      firehose        = optional(list(object({
        delivery_stream = optional(string)
        enabled         = bool
      })))
      s3              = optional(list(object({
        bucket  = optional(string)
        enabled = bool
        prefix  = optional(string)
      })))
    }))
  }))
  default     = []
}
variable "msk_cluster_open_monitoring" {
  description = "Configuration block for JMX and Node monitoring for the MSK cluster"
  type        = list(object({
    prometheus = list(object({
      jmx_exporter = optional(list(object({
        enabled_in_broker = bool
      })))
      node_exporter = optional(list(object({
        enabled_in_broker = bool
      })))
    }))
  }))
  default     = []
}
