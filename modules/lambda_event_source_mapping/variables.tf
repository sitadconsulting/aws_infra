variable "lambda_event_source_mapping_batch_size" {
  description = "The largest number of records that Lambda will retrieve from your event source at the time of invocation. Defaults to 100 for DynamoDB, Kinesis, MQ and MSK, 10 for SQS"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_bisect_batch_on_function_error" {
  description = "If the function returns an error, split the batch in two and retry. Only available for stream sources (DynamoDB and Kinesis). Defaults to false"
  type        = bool
  default     = false
}
variable "lambda_event_source_mapping_enabled" {
  description = "Determines if the mapping will be enabled on creation. Defaults to true"
  type        = bool
  default     = true
}
variable "lambda_event_source_mapping_event_source_arn" {
  description = "The event source ARN - this is required for Kinesis stream, DynamoDB stream, SQS queue, MQ broker, MSK cluster or DocumentDB change stream. It is incompatible with a Self Managed Kafka source"
  type        = string
  default     = null
}
variable "lambda_event_source_mapping_function_name" {
  description = "The name or the ARN of the Lambda function that will be subscribing to events"
  type        = string
  default     = ""
}
variable "lambda_event_source_mapping_function_response_types" {
  description = "A list of current response type enums applied to the event source mapping for AWS Lambda checkpointing. Only available for SQS and stream sources (DynamoDB and Kinesis). Valid values: ReportBatchItemFailures"
  type        = list(string)
  default     = [ ReportBatchItemFailures, ]
}
variable "lambda_event_source_mapping_maximum_batching_window_in_seconds" {
  description = "The maximum amount of time to gather records before invoking the function, in seconds (between 0 and 300). Records will continue to buffer (or accumulate in the case of an SQS queue event source) until either maximum_batching_window_in_seconds expires or batch_size has been met. For streaming event sources, defaults to as soon as records are available in the stream. If the batch it reads from the stream or queue only has one record in it, Lambda only sends one record to the function. Only available for stream sources (DynamoDB and Kinesis) and SQS standard queues"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_maximum_record_age_in_seconds" {
  description = "The maximum age of a record that Lambda sends to a function for processing. Only available for stream sources (DynamoDB and Kinesis). Must be either -1 (forever, and the default value) or between 60 and 604800 (inclusive)"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_maximum_retry_attempts" {
  description = "The maximum number of times to retry when the function returns an error. Only available for stream sources (DynamoDB and Kinesis). Minimum and default of -1 (forever), maximum of 10000"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_parallelization_factor" {
  description = "The number of batches to process from each shard concurrently. Only available for stream sources (DynamoDB and Kinesis). Minimum and default of 1, maximum of 10"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_queues" {
  description = "The name of the Amazon MQ broker destination queue to consume. Only available for MQ sources. The list must contain exactly one queue name"
  type        = list(string)
  default     = null
}
variable "lambda_event_source_mapping_starting_position" {
  description = "The position in the stream where AWS Lambda should start reading. Must be one of AT_TIMESTAMP (Kinesis only), LATEST or TRIM_HORIZON if getting events from Kinesis, DynamoDB, MSK or Self Managed Apache Kafka. Must not be provided if getting events from SQS"
  type        = string
  default     = null
}
variable "lambda_event_source_mapping_starting_position_timestamp" {
  description = "A timestamp in RFC3339 format of the data record which to start reading when using starting_position set to AT_TIMESTAMP. If a record with this exact timestamp does not exist, the next later record is chosen. If the timestamp is older than the current trim horizon, the oldest available record is chosen"
  type        = string
  default     = ""
}
variable "lambda_event_source_mapping_topics" {
  description = "The name of the Kafka topics. Only available for MSK sources. A single topic name must be specified"
  type        = list(string)
  default     = null
}
variable "lambda_event_source_mapping_tumbling_window_in_seconds" {
  description = "The duration in seconds of a processing window for AWS Lambda streaming analytics. The range is between 1 second up to 900 seconds. Only available for stream sources (DynamoDB and Kinesis)"
  type        = number
  default     = null
}
variable "lambda_event_source_mapping_amazon_managed_kafka_event_source_config" {
  description = "A Kafka consumer group ID between 1 and 200 characters for use when creating this event source mapping. If one is not specified, this value will be automatically generated"
  type        = list(object({
    consumer_group_id = optional(string)
  }))
  default     = []
}
variable "lambda_event_source_mapping_destination_config" {
  description = "An Amazon SQS queue or Amazon SNS topic destination for failed records. Only available for stream sources (DynamoDB and Kinesis)"
  type        = list(object({
    on_failure = optional(list(object({
      destination_arn = string
    })), [])
  }))
  default     = []
}
variable "lambda_event_source_mapping_document_db_event_source_config" {
  description = "Configuration settings for a DocumentDB event source"
  type        = list(object({
    collection_name = optional(string)
    database_name   = string
    full_document   = optional(string)
  }))
  default     = []
}
variable "lambda_event_source_mapping_filter_criteria" {
  description = "The criteria to use for event filtering Kinesis stream, DynamoDB stream, SQS queue event sources"
  type        = list(object({
    filter = optional(list(object({
      pattern = optional(string)
    })))
  }))
  default     = []
}
variable "lambda_event_source_mapping_scaling_config" {
  description = "Scaling configuration of the event source. Only available for SQS queues"
  type        = list(object({
    maximum_concurrency = optional(number)
  }))
  default     = []
}
variable "lambda_event_source_mapping_self_managed_event_source" {
  description = "For Self Managed Kafka sources, the location of the self managed cluster. If set, configuration must also include source_access_configuration"
  type        = list(object({
    endpoints = map(string)
  }))
  default     = []
}
variable "lambda_event_source_mapping_self_managed_kafka_event_source_config" {
  description = "Additional configuration block for Self Managed Kafka sources. Incompatible with \"event_source_arn\" and \"amazon_managed_kafka_event_source_config\""
  type        = list(object({
    consumer_group_id = optional(string)
  }))
  default     = null
}
variable "lambda_event_source_mapping_source_access_configuration" {
  description = "For Self Managed Kafka sources, the access configuration for the source. If set, configuration must also include self_managed_event_source"
  type        = list(object({
    type = string
    uri  = string
  }))
  default     = []
}
