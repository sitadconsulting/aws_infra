resource "aws_scheduler_schedule" "scheduler_schedule" {
  action_after_completion      = var.scheduler_schedule_action_after_completion
  description                  = var.scheduler_schedule_description
  end_date                     = var.scheduler_schedule_end_date
  group_name                   = var.scheduler_schedule_group_name
  kms_key_arn                  = var.scheduler_schedule_kms_key_arn
  name                         = var.scheduler_schedule_name
  name_prefix                  = var.scheduler_schedule_name_prefix
  schedule_expression          = var.scheduler_schedule_schedule_expression
  schedule_expression_timezone = var.scheduler_schedule_schedule_expression_timezone
  start_date                   = var.scheduler_schedule_start_date
  state                        = var.scheduler_schedule_state
   
  dynamic "flexible_time_window" {
    for_each = var.scheduler_schedule_flexible_time_window
      content {
        maximum_window_in_minutes = flexible_time_window.value["maximum_window_in_minutes"]
        mode                      = flexible_time_window.value["mode"]
      }
  }
  dynamic "target" {
    for_each = var.scheduler_schedule_target
      content {
        arn      = target.value["arn"]
        role_arn = target.value["role_arn"]
        input    = target.value["input"]
        dynamic "dead_letter_config" {
          for_each = target.value.dead_letter_config
            content {
              arn = dead_letter_config.value["arn"]    
            }
        }
        dynamic "ecs_parameters" {
          for_each = target.value.ecs_parameters
            content {
              enable_ecs_managed_tags    = ecs_parameters.value["enable_ecs_managed_tags"]
              enable_execute_command     = ecs_parameters.value["enable_execute_command"]
              group                      = ecs_parameters.value["group"]
              launch_type                = ecs_parameters.value["launch_type"]
              platform_version           = ecs_parameters.value["platform_version"]
              propagate_tags             = ecs_parameters.value["propagate_tags"]
              reference_id               = ecs_parameters.value["reference_id"]
              tags                       = ecs_parameters.value["tags"]
              task_count                 = ecs_parameters.value["task_count"]
              task_definition_arn        = ecs_parameters.value["task_definition_arn"]
              dynamic "capacity_provider_strategy" {
                for_each = ecs_parameters.value.capacity_provider_strategy
                  content {
                    base              = capacity_provider_strategy.value["base"]
                    capacity_provider = capacity_provider_strategy.value["capacity_provider"]
                    weight            = capacity_provider_strategy.value["weight"]
                  }
              }
              dynamic "network_configuration" {
                for_each = ecs_parameters.value.network_configuration
                  content {
                    assign_public_ip = network_configuration.value["assign_public_ip"]
                    security_groups  = network_configuration.value["security_groups"]
                    subnets          = network_configuration.value["subnets"]
                  }
              }
              dynamic "placement_constraint" {
                for_each = ecs_task_parameters.value.placement_constraint
                  content {
                    expression = placement_constraint.value["expression"]
                    type       = placement_constraint.value["type"]
                  }
              }
              dynamic "placement_strategy" {
                for_each = ecs_task_parameters.value.placement_strategy
                  content {
                    field = placement_strategy.value["field"]
                    type  = placement_strategy.value["type"]
                  }
              }
            }
        }
        dynamic "eventbridge_parameters" {
          for_each = target.value.eventbridge_parameters
            content {
              detail_type = eventbridge_parameters.value["detail_type"]
              source      = eventbridge_parameters.value["source"]
            }
        }
        dynamic "kinesis_parameters" {
          for_each = target.value.kinesis_parameters
            content {
              partition_key = kinesis_parameters.value["partition_key"]
            }
        }
        dynamic "retry_policy" {
          for_each = target.value.retry_policy
            content {
              maximum_event_age_in_seconds = retry_policy.value["maximum_event_age_in_seconds"]
              maximum_retry_attempts       = retry_policy.value["maximum_retry_attempts"]
            }
        }
        dynamic "sagemaker_pipeline_parameters" {
          for_each = target.value.sagemaker_pipeline_parameters
            content {
              dynamic "pipeline_parameter" {
                for_each = sagemaker_pipeline_parameters.value.pipeline_parameter
                  content {
                    name  = pipeline_parameter.value["name"]
                    value = pipeline_parameter.value["value"]
                  }
              }
            }
        }
        dynamic "sqs_parameters" {
          for_each = target.value.sqs_parameters
            content {
              message_group_id = sqs_parameters.value["message_group_id"]
            }
        }
      }
  }
}
