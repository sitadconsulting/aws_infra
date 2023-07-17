resource "aws_lambda_event_source_mapping" "lambda_event_source_mapping" {
  batch_size                         = var.lambda_event_source_mapping_batch_size
  bisect_batch_on_function_error     = var.lambda_event_source_mapping_bisect_batch_on_function_error
  enabled                            = var.lambda_event_source_mapping_enabled
  event_source_arn                   = var.lambda_event_source_mapping_event_source_arn
  function_name                      = var.lambda_event_source_mapping_function_name
  function_response_types            = var.lambda_event_source_mapping_function_response_types
  maximum_batching_window_in_seconds = var.lambda_event_source_mapping_maximum_batching_window_in_seconds
  maximum_record_age_in_seconds      = var.lambda_event_source_mapping_maximum_record_age_in_seconds
  maximum_retry_attempts             = var.lambda_event_source_mapping_maximum_retry_attempts
  parallelization_factor             = var.lambda_event_source_mapping_parallelization_factor
  queues                             = var.lambda_event_source_mapping_queues
  starting_position                  = var.lambda_event_source_mapping_starting_position
  starting_position_timestamp        = var.lambda_event_source_mapping_starting_position_timestamp
  topics                             = var.lambda_event_source_mapping_topics
  tumbling_window_in_seconds         = var.lambda_event_source_mapping_tumbling_window_in_seconds
 

  dynamic "amazon_managed_kafka_event_source_config" {
    for_each = var.lambda_event_source_mapping_amazon_managed_kafka_event_source_config
      content {
        consumer_group_id = amazon_managed_kafka_event_source_config.value["consumer_group_id"]
      }
  }
  dynamic "destination_config" {
    for_each = var.lambda_event_source_mapping_destination_config
      content {
        dynamic "on_failure" {
          for_each = destination_config.value.on_failure
            content {
              destination_arn = on_failure.value["destination_arn"]
            }
        }
      }
  }
  dynamic "document_db_event_source_config" {
    for_each = var.lambda_event_source_mapping_document_db_event_source_config
      content {
        collection_name = document_db_event_source_config.value["collection_name"]
        database_name   = document_db_event_source_config.value["database_name"]
        full_document   = document_db_event_source_config.value["full_document"]
      }
  }
  dynamic "filter_criteria" {
    for_each = var.lambda_event_source_mapping_filter_criteria
      content {
        dynamic "filter" {
          for_each = filter_criteria.value.filter
            content {
              pattern = filter.value["pattern"]
            }
        }
      }
  }
  dynamic "scaling_config" {
    for_each = var.lambda_event_source_mapping_scaling_config
      content {
        maximum_concurrency = scaling_config.value["maximum_concurrency"]
      }
  }
  dynamic "self_managed_event_source" {
    for_each = var.lambda_event_source_mapping_self_managed_event_source
      content {
        endpoints = self_managed_event_source.value["endpoints"]
      }
  }
  dynamic "self_managed_kafka_event_source_config" {
    for_each = var.lambda_event_source_mapping_self_managed_kafka_event_source_config
      content {
        consumer_group_id = self_managed_kafka_event_source_config.value["consumer_group_id"]
      }
  }
  dynamic "source_access_configuration" {
    for_each = var.lambda_event_source_mapping_source_access_configuration
      content {
        type = source_access_configuration.value["type"]
        uri  = source_access_configuration.value["uri"]
      }
  }
}
