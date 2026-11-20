variable "scheduler_schedule_action_after_completion" {
  description = "(Optional) Action that applies to the schedule after completing invocation of the target. Valid values are NONE and DELETE. Defaults to NONE"
  type        = string
  default     = null
}
variable "scheduler_schedule_description" {
  description = "(Optional) Brief description of the schedule"
  type        = string
  default     = null
}
variable "scheduler_schedule_end_date" {
  description = "(Optional) The date, in UTC, before which the schedule can invoke its target. Depending on the schedule's recurrence expression, invocations might stop on, or before, the end date you specify. EventBridge Scheduler ignores the end date for one-time schedules. Example: 2030-01-01T01:00:00Z"
  type        = string
  default     = null
}
variable "scheduler_schedule_group_name" {
  description = "(Optional, Forces new resource) Name of the schedule group to associate with this schedule. When omitted, the default schedule group is used"
  type        = string
  default     = null
}
variable "scheduler_schedule_kms_key_arn" {
  description = "(Optional) ARN for the customer managed KMS key that EventBridge Scheduler will use to encrypt and decrypt your data"
  type        = string
  default     = null
}
variable "scheduler_schedule_name" {
  description = "(Optional, Forces new resource) Name of the schedule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "scheduler_schedule_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "scheduler_schedule_schedule_expression" {
  description = "(Required) Defines when the schedule runs"
  type        = string
}
variable "scheduler_schedule_schedule_expression_timezone" {
  description = "(Optional) Timezone in which the scheduling expression is evaluated. Defaults to UTC. Example: Australia/Sydney"
  type        = string
  default     = null
}
variable "scheduler_schedule_start_date" {
  description = "(Optional) The date, in UTC, after which the schedule can begin invoking its target. Depending on the schedule's recurrence expression, invocations might occur on, or after, the start date you specify. EventBridge Scheduler ignores the start date for one-time schedules. Example: 2030-01-01T01:00:00Z"
  type        = string
  default     = null
}
variable "scheduler_schedule_state" {
  description = "(Optional) Specifies whether the schedule is enabled or disabled. One of: ENABLED (default), DISABLED"
  type        = string
  default     = null
}
variable "scheduler_schedule_flexible_time_window" {
  description = "(Required) Configures a time window during which EventBridge Scheduler invokes the schedule"
  type        = list(object({
    maximum_window_in_minutes = optional(number)
    mode                      = string
  }))
}
variable "scheduler_schedule_target" {
  description = "(Required) Configures the target of the schedule"
  type        = list(object({
    arn                = string
    role_arn           = string
    input              = optional(string)
    dead_letter_config = optional(list(object({
      arn = string
    })), []) 
    ecs_parameters     = optional(list(object({
      enable_ecs_managed_tags    = optional(bool)
      enable_execute_command     = optional(bool)
      group                      = optional(string)
      launch_type                = optional(string)
      platform_version           = optional(string)
      propagate_tags             = optional(string)
      reference_id               = optional(string)
      tags                       = optional(map(string))
      task_count                 = optional(number)
      task_definition_arn        = string
      capacity_provider_strategy = optional(list(object({
        base              = optional(number)
        capacity_provider = string
        weight            = optional(number)
      })), [])
      network_configuration      = optional(list(object({
        assign_public_ip = optional(bool)
        security_groups  = optional(list(string))
        subnets          = list(string)
      })), [])
      placement_constraints      = optional(list(object({
        expression = optional(string)
        type       = string
      })), [])
      placement_strategy         = optional(list(object({
        field = optional(string)
        type  = string
      })), [])
    })), [])
    eventbridge_parameters        = optional(list(object({
      detail_type = string
      source      = string
    })), [])
    kinesis_parameters            = optional(list(object({
      partition_key = string
    })), [])
    retry_policy                  = optional(list(object({
      maximum_event_age_in_seconds = optional(number)
      maximum_retry_attempts       = optional(number)
    })), [])
    sagemaker_pipeline_parameters = optional(list(object({
      pipeline_parameter = optional(list(object({
        name  = string
        value = string
      })), [])
    })), [])
    sqs_parameters                = optional(list(object({
      message_group_id = optional(string)
    })), [])
  }))
}
