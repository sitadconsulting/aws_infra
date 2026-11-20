variable "pipes_pipe_description" {
  description = "(Optional) Description of the pipe. At most 512 characters"
  type        = string
  default     = null
}
variable "pipes_pipe_desired_state" {
  description = "(Optional) State the pipe should be in. One of: RUNNING, STOPPED"
  type        = string
  default     = null
}
variable "pipes_pipe_enrichment" {
  description = "(Optional) Enrichment resource of the pipe (typically an ARN)"
  type        = string
  default     = null
}
variable "pipes_pipe_kms_key_identifier" {
  description = "(Optional) Identifier of the AWS KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt pipe data. The identifier can be the key ARN, KeyId, key alias, or key alias ARN. If not set, EventBridge uses an AWS owned key to encrypt pipe data"
  type        = string
  default     = null
}
variable "pipes_pipe_name" {
  description = "(Optional) Name of the pipe. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "pipes_pipe_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "pipes_pipe_role_arn" {
  description = "(Required) ARN of the role that allows the pipe to send data to the target"
  type        = string
}
variable "pipes_pipe_source" {
  description = "(Required) Source resource of the pipe. This field typically requires an ARN. However, when using a self-managed Kafka cluster, you should use a different format. Instead of an ARN, use 'smk://' followed by the bootstrap server's address"
  type        = string
}
variable "pipes_pipe_tags" {
  description = "(Optional) Map of tags assigned to the resource"
  type        = map(string)
  default     = {}
}
variable "pipes_pipe_target" {
  description = "(Required) Target resource of the pipe (typically an ARN)"
  type        = string
}
variable "pipes_pipe_enrichment_parameters" {
  description = "(Optional) Parameters to configure enrichment for the pipe"
  type        = list(object({
    input_template = optional(string)
    http_parameters = optional(list(object({
      header_parameters       = optional(map(string))
      path_parameter_values   = optional(list(string))
      query_string_parameters = optional(map(string))
    })), [])
  }))
  default     = []
}
variable "pipes_pipe_log_configuration" {
  description = "(Optional) Logging configuration settings for the pipe"
  type        = list(object({
    include_execution_data          = optional(list(string))
    level                           = string
    cloudwatch_logs_log_destination = optional(list(object({
      log_group_arn = string
    })), [])
    firehose_log_destination        = optional(list(object({
      delivery_stream_arn = string
    })), [])
    s3_log_destination              = optional(list(object({
      bucket_name   = string
      bucket_owner  = string
      output_format = optional(string)
      prefix        = optional(string)
    })), [])
  }))
  default     = []
}
variable "pipes_pipe_source_parameters" {
  description = "(Optional) Parameters to configure a source for the pipe"
  type        = list(object({
    activemq_broker_parameters         = optional(list(object({
      batch_size                         = optional(number)
      maximum_batching_window_in_seconds = optional(number) 
      queue_name                         = string
      credentials                        = list(object({
        basic_auth = string
      }))
    })), [])
    dynamodb_stream_parameters         = optional(list(object({
      batch_size                         = optional(number)
      maximum_batching_window_in_seconds = optional(number) 
      maximum_record_age_in_seconds      = optional(number)
      maximum_retry_attempts             = optional(number)
      on_partial_batch_item_failure      = optional(string)
      parallelization_factor             = optional(number)
      starting_position                  = string
      dead_letter_config                 = optional(list(object({
        arn = optional(string)
      })), [])
    })), [])
    filter_criteria                    = optional(list(object({
      filter = optional(list(object({
        pattern = string
      })), [])
    })), [])
    kinesis_stream_parameters          = optional(list(object({
      batch_size                         = optional(number)
      maximum_batching_window_in_seconds = optional(number)
      maximum_record_age_in_seconds      = optional(number)
      maximum_retry_attempts             = optional(number)
      on_partial_batch_item_failure      = optional(string)
      parallelization_factor             = optional(number)
      starting_position                  = string
      starting_position_timestamp        = optional(string)
      dead_letter_config                 = optional(list(object({
        arn = optional(string)
      })), [])
    })), [])
    managed_streaming_kafka_parameters = optional(list(object({
      batch_size                         = optional(number)
      consumer_group_id                  = optional(string)
      maximum_batching_window_in_seconds = optional(number)
      starting_position                  = optional(string)
      topic_name                         = string
      credentials                        = optional(list(object({
        client_certificate_tls_auth = optional(string)
        sasl_scram_512_auth         = optional(string)
      })), [])
    })), [])
    rabbitmq_broker_parameters         = optional(list(object({
      batch_size                         = optional(number)
      maximum_batching_window_in_seconds = optional(number)
      queue_name                         = string
      virtual_host                       = optional(string)
      credentials                        = list(object({
        basic_auth = string
      }))
    })), [])
    self_managed_kafka_parameters      = optional(list(object({
      additional_bootstrap_servers       = optional(list(string))
      batch_size                         = optional(number)
      consumer_group_id                  = optional(string)
      maximum_batching_window_in_seconds = optional(number)
      server_root_ca_certificate         = optional(string)
      starting_position                  = optional(string)
      topic_name                         = string
      credentials                        = optional(list(object({
        basic_auth                  = optional(string)
        client_certificate_tls_auth = optional(string)
        sasl_scram_256_auth         = optional(string)
        sasl_scram_512_auth         = optional(string)
      })), [])
      vpc                                = 
        security_groups = optional(list(string))
        subnets         = optional(list(string))
    })), [])
    sqs_queue_parameters               = optional(list(object({
      batch_size                         = optional(number)
      maximum_batching_window_in_seconds = optional(number)
    })), [])
  }))
  default     = []
}
variable "pipes_pipe_target_parameters" {
  description = "(Optional) Parameters to configure a target for the pipe"
  type        = list(object({
    input_template                         = optional(string)
    batch_job_parameters                   = optional(list(object({
      job_definition      = string
      job_name            = string
      parameters          = optional(map(string))
      array_properties    = optional(list(object({
        size = optional(number)
      })), [])
      container_overrides = optional(list(object({
        command       = optional(list(string))
        instance_type = optional(string)
        environment   = optional(list(object({
          name  = optional(string)
          value = optional(string)
        })), [])
        resource_requirement = optional(list(object({
          type  = string
          value = string
        })), [])
      })), [])
      depends_on          = optional(list(object({
        job_id = optional(string)
        type   = optional(string)
      })), [])
      retry_strategy      = optional(list(object({
        attempts = optional(number)
      })), []) 
    })), [])
    cloudwatch_logs_parameters             = optional(list(object({
      log_stream_name = optional(string)
      timestamp       = optional(string)
    })), [])
    ecs_task_parameters                    = optional(list(object({
      enable_ecs_managed_tags    = optional(bool) 
      enable_execute_command     = optional(bool)
      group                      = optional(string)
      launch_type                = optional(string)
      platform_version           = optional(string) 
      propagate_tags             = optional(string)
      reference_id               = optional(string)
      tags                       = optiona(map(string))
      task_count                 = optional(number)
      task_definition_arn        = string 
      capacity_provider_strategy = optional(list(object({
        base              = optional(number)
        capacity_provider = string
        weight            = optional(number)
      })), [])
      network_configuration      = optional(list(object({
        aws_vpc_configuration = optional(list(object({
          assign_public_ip = optional(string)
          security_groups  = optional(list(string))
          subnets          = optional(list(string))
        })), [])
      })), [])
      overrides                  = optional(list(object({
        cpu                            = optional(string)
        execution_role_arn             = optional(string)
        memory                         = optional(string)
        task_role_arn                  = optional(string)
        container_override             = optional(list(object({
          command              = optional(list(string))
          cpu                  = optional(number)
          memory               = optional(number)
          memory_reservation   = optional(number)
          name                 = optional(string)
          environment          = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })), [])
          environment_file     = optional(list(object({
            type  = string
            value = string
          })), [])
          resource_requirement = optional(list(object({
            type  = string
            value = string
          })), [])
        })),[])
        ephemeral_storage              = optional(list(object({
          size_in_gib = number
        })), [])
        inference_accelerator_override = optional(list(object({
          device_name = optional(string)
          device_type = optional(string)
        })), [])
      })), [])
      placement_constraint       = optional(list(object({
        expression = optional(string)
        type       = optional(string)
      })), [])
      placement_strategy         = optional(list(object({
        field = optional(string)
        type  = optional(string)
      })), [])
    })), [])
    eventbridge_event_bus_parameters       = optional(list(object({
      detail_type = optional(string)
      endpoint_id = optional(string)
      resources   = optional(list(string))
      source      = optional(string)
      time        = optional(string)
    })), [])
    http_parameters                        = optional(list(object({
      header_parameters       = optional(map(string))
      path_parameter_values   = optional(list(string)) 
      query_string_parameters = optional(map(string))
    })), [])
    kinesis_stream_parameters              = optional(list(object({
      partition_key = string
    })), [])
    lambda_function_parameters             = optional(list(object({
      invocation_type = string
    })), [])
    redshift_data_parameters               = optional(list(object({
      database           = string
      db_user            = optional(string)
      secret_manager_arn = optional(string)
      sqls               = list(string)
      statement_name     = optional(string)
      with_event         = optional(bool)
    })), [])
    sagemaker_pipeline_parameters          = optional(list(object({
      pipeline_parameter = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    sqs_queue_parameters                   = optional(list(object({
      message_deduplication_id = optional(string)
      message_group_id         = optional(string)
    })), [])
    step_function_state_machine_parameters = optional(list(object({
      invocation_type = string
    })), [])
  }))
  default     = []
}
