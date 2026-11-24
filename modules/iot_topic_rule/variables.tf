variable "iot_topic_rule_description" {
  description = "(Optional) The description of the rule"
  type        = string
  default     = null
}
variable "iot_topic_rule_enabled" {
  description = "(Required) Specifies whether the rule is enabled"
  type        = bool
  default     = null
}
variable "iot_topic_rule_name" {
  description = "(Required) The name of the rule"
  type        = string
}
variable "iot_topic_rule_sql" {
  description = "(Required) The SQL statement used to query the topic"
  type        = string
}
variable "iot_topic_rule_sql_version" {
  description = "(Required) The version of the SQL rules engine to use when evaluating the rule"
  type        = string
}
variable "iot_topic_rule_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
variable "iot_topic_rule_cloudwatch_alarm" {
  descrition = "(Optional) Action configuration block to change the state of a Cloudwatch alarm"
  type       = list(object({
    alarm_name   = string
    role_arn     = string
    state_reason = string
    state_value  = string
  }))
  default    = []
}
variable "iot_topic_rule_cloudwatch_logs" {
  description = "(Optional) Action configuration block to send data to Cloudwatch logs"
  type        = list(object({
    batch_mode     = optional(bool)
    log_group_name = string
    role_arn       = string
  }))
  default     = []
}
variable "iot_topic_rule_cloudwatch_metric" {
  description = "(Optional) Action configuration block to capture a Cloudwatch metric"
  type        = list(object({
    metric_name      = string
    metric_namespace = string
    metric_timestamp = optional(string)
    metric_unit      = string
    metric_value     = string
    role_arn         = string
  }))
  default     = []
}
variable "iot_topic_rule_dynamodb" {
  description = "(Optional) Action configuration block to write a DynamoDB table"
  type        = list(object({
    hash_key_field  = string
    hash_key_type   = optional(string)
    hash_key_value  = string
    payload_field   = optional(string)
    range_key_field = optional(string)
    range_key_type  = optional(string)
    range_key_value = optional(string)
    operation       = optional(string)
    role_arn        = string
    table_name      = string
  }))
  default     = [] 
}
variable "iot_topic_rule_dynamodbv2" {
  description = "(Optional) Action configuration block that allows you to write each attribute in an MQTT message payload into a separate DynamoDB column"
  type        = list(object({
    role_arn = string
    put_item = list(object({
      table_name = string
    }))
  }))
  default     = []
}
variable "iot_topic_rule_elasticsearch" {
  description = "(Optional) Action configuration block that allows you to write data to Amazon OpenSearch Service domain"
  type        = list(object({
    endpoint = string 
    id       = string
    index    = string
    role_arn = string
    type     = string
  }))
  default     = []
}
variable "iot_topic_rule_error_action" {
  description = "(Optional) Configuration block with error action to be associated with the rule. See the documentation for cloudwatch_alarm, cloudwatch_logs, cloudwatch_metric, dynamodb, dynamodbv2, elasticsearch, firehose, http, iot_analytics, iot_events, kafka, kinesis, lambda, republish, s3, sns, sqs, step_functions, timestream configuration blocks for further configuration details"
  type        = list(object({
    cloudwatch_alarm  = optional(list(object({
      alarm_name   = string
      role_arn     = string
      state_reason = string
      state_value  = string
    })), [])
    cloudwatch_logs   = optional(list(object({
      batch_mode     = optional(bool)
      log_group_name = string
      role_arn       = string
    })), []) 
    cloudwatch_metric = optional(list(object({
      metric_name      = string
      metric_namespace = string
      metric_timestamp = optional(string)
      metric_unit      = string
      metric_value     = string
      role_arn         = string
    })), [])
    dynamodb          = optional(list(object({
      hash_key_field  = string
      hash_key_type   = optional(string)
      hash_key_value  = string
      operation       = optional(string)
      payload_field   = optional(string)
      range_key_field = optional(string)
      range_key_type  = optional(string)
      range_key_value = optional(string)
      role_arn        = string
      table_name      = string
    })), [])
    dynamodbv2        = optional(list(object({
      role_arn = string
      put_item = optional(list(object({
        table_name = string
      })), [])
    })), [])
    elasticsearch     = optional(list(object({
      endpoint = string
      id       = string
      index    = string
      role_arn = string
      type     = string
    })), [])
    firehose          = optional(list(object({
      batch_mode           = optional(bool)
      delivery_stream_name = string
      role_arn             = string
      separator            = optional(string)
    })), [])
    http              = optional(list(object({
      confirmation_url = optional(string)
      url              = string 
      http_header      = optional(list(object({
        key   = string
        value = string
      })), [])
    })), [])
    iot_analytics     = optional(list(object({
      batch_mode   = optional(bool)
      channel_name = string
      role_arn     = string
    })), [])
    iot_events        = optional(list(object({
      batch_mode = optional(bool)
      input_name = string
      message_id = optional(string)
      role_arn   = string
    })), [])
    kafka             = optional(list(object({
      client_properties = map(string)
      destination_arn   = string
      key               = optional(string) 
      partition         = optional(string)
      topic             = string
      header            = optional(list(object({
        key   = string
        value = string
      })), [])
    })), [])
    kinesis           = optional(list(object({
      partition_key = optional(string)
      role_arn      = string
      stream_name   = string
    })), [])
    lambda            = optional(list(object({
      function_arn = string
    })), [])
    republish         = optional(list(object({
      qos      = optional(number)
      role_arn = string
      topic    = string
    })), [])
    s3                = optional(list(object({
      bucket_name = string
      canned_acl  = optional(string)
      key         = string
      role_arn    = string
    })), [])
    sns               = optional(list(object({
      message_format = optional(string)
      role_arn       = string
      target_arn     = string
    })), [])
    sqs               = optional(list(object({
      queue_url  = string
      role_arn   = string
      use_base64 = string
    })), [])
    step_functions    = optional(list(object({
      execution_name_prefix = optional(string)
      state_machine_name    = string
      role_arn              = string
    })), [])
    timestream        = optional(list(object({
      database_name = string
      role_arn      = string
      table_name    = string
      dimension     = optional(list(object({
        name  = string
        value = string
      })), [])
      timestamp     = optional(list(object({
        unit  = string
        value = string
      })), []) 
    })), [])
  }))
  default     = []
}
variable "iot_topic_rule_firehose" {
  description = "(Optional) Action configuration block that allows you to write to an Amazon Kinesis Firehose stream"
  type        = list(object({
    batch_mode           = optional(bool)
    delivery_stream_name = string
    role_arn             = string
    separator            = optional(string)
  }))
  default     = []
}
variable "iot_topic_rule_http" {
  description = "(Optional) Action configuration block that allows you to send data to an HTTPS endpoint"
  type        = list(object({
    confirmation_url = optional(string)
    url              = string 
    http_header      = optional(list(object({
      key   = string
      value = string
    })), [])
  }))
  default     = []
}
variable "iot_topic_rule_iot_analytics" {
  description = "(Optional) Action configuration block that allows you to send message data to an AWS IoT Analytics channel"
  type        = list(object({
    batch_mode   = optional(bool)
    channel_name = string
    role_arn     = string
  }))
  default     = []
}
variable "iot_topic_rule_iot_events" {
  description = "(Optional) Action configuration block that allows you to send an input to an AWS IoT Events detector"
  type        = list(object({
    batch_mode = optional(bool)
    input_name = string
    message_id = optional(string)
    role_arn   = string
  }))
  default     = []
}
variable "iot_topic_rule_kafka" {
  description = "(Optional) Action configuration block that allows you to send messages to an Amazon Managed Streaming for Apache Kafka (Amazon MSK) or self-managed Apache Kafka cluster"
  type        = list(object({
    client_properties = map(string)
    destination_arn   = string
    key               = optional(string) 
    partition         = optional(string)
    topic             = string
    header            = optional(list(object({
      key   = string
      value = string
    })), [])
  }))
  default     = []
}
variable "iot_topic_rule_kinesis" {
  description = "(Optional) Action configuration block that allows you to write data to an Amazon Kinesis stream"
  type        = list(object({
    partition_key = optional(string)
    role_arn      = string
    stream_name   = string
  }))
  default     = []
}
variable "iot_topic_rule_lambda" {
  description = "(Optional) Action configuration block that allows you to invoke a Lambda function"
  type        = list(object({
    function_arn = string
  }))
  default     = []
}
variable "iot_topic_rule_republish" {
  description = "(Optional) Action configuration block that allows you to publish to another MQTT topic"
  type        = list(object({
    qos      = optional(number)
    role_arn = string
    topic    = string
  }))
  default     = []
}
variable "iot_topic_rule_s3" {
  description = "(Optional) Action configuration block that allows you to write to an Amazon S3 bucket"
  type        = list(object({
    bucket_name = string
    canned_acl  = optional(string)
    key         = string
    role_arn    = string
  }))
  default     = []
}
variable "iot_topic_rule_sns" {
  description = "(Optional) Action configuration block that allows you to publish to an Amazon SNS topic"
  type        = list(object({
    message_format = optional(string)
    role_arn       = string
    target_arn     = string
  }))
  default     = []
}
variable "iot_topic_rule_sqs" {
  description = "(Optional) Action configuration block that allows you to publish to an Amazon SQS queue"
  type        = list(object({
    queue_url  = string
    role_arn   = string
    use_base64 = string
  }))
  default     = []
}
variable "iot_topic_rule_step_functions" {
  description = "(Optional) Action configuration block that allows you to start execution of a Step Functions state machine"
  type        = list(object({
    execution_name_prefix = optional(string)
    state_machine_name    = string
    role_arn              = string
  }))
  default     = []
}
variable "iot_topic_rule_timestream" {
  description = "(Optional) Action configuration block that allows you to write attributes from an MQTT message"
  type        = list(object({
    database_name = string
    role_arn      = string
    table_name    = string
    dimension     = optional(list(object({
      name  = string
      value = string
    })), [])
    timestamp     = optional(list(object({
      unit  = string
      value = string
    })), []) 
  }))
  default     = []
}
