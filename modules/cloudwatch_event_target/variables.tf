variable "cloudwatch_event_target_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of the target"
  type        = string
}
variable "cloudwatch_event_target_event_bus_name" {
  description = "(Optional) The name or ARN of the event bus to associate with the rule. If you omit this, the default event bus is used"
  type        = string
  default     = null
}
variable "cloudwatch_event_target_force_destroy" {
  description = "(Optional) Used to delete managed rules created by AWS. Defaults to false"
  type        = bool
  default     = false
}
variable "cloudwatch_event_target_input" {
  description = "(Optional) Valid JSON text passed to the target. Conflicts with input_path and input_transformer"
  type        = string
  default     = null
}
variable "cloudwatch_event_target_input_path" {
  description = "(Optional) The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with input and input_transformer"
  type        = string
  default     = null
}
variable "cloudwatch_event_target_role_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if ecs_target is used or target in arn is EC2 instance, Kinesis data stream, Step Functions state machine, or Event Bus in different account or region"
  type        = string
  default     = null
}
variable "cloudwatch_event_target_rule" {
  description = "(Required) The name of the rule you want to add targets to"
  type        = string
}
variable "cloudwatch_event_target_target_id" {
  description = "(Optional) The unique target assignment ID. If missing, will generate a random, unique id"
  type        = string
  default     = null
}
variable "cloudwatch_event_target_appsync_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an AppSync GraphQL API mutation. A maximum of 1 are allowed"
  type        = list(object({
    graphql_operation = optional(string)
  }))
  default     = []
}
variable "cloudwatch_event_target_batch_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Batch Job. A maximum of 1 are allowed"
  type        = list(object({
    array_size     = optional(number)
    job_attempts   = optional(number)
    job_definition = string
    job_name       = string
  }))
  default     = []
}
variable "cloudwatch_event_target_dead_letter_config" {
  description = "(Optional) Parameters used when you are providing a dead letter config. A maximum of 1 are allowed"
  type        = list(object({
    arn = optional(string)
  }))
  default     = []
}
variable "cloudwatch_event_target_ecs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon ECS Task. A maximum of 1 are allowed"
  type        = list(object({
    enable_ecs_managed_tags = optional(bool)
    enable_execute_command  = optional(bool)
    group                   = optional(string)
    launch_type             = optional(string)
    platform_version        = optional(string)
    propagate_tags          = optional(string)
    tags                    = optional(map(string))
    task_count              = optional(number)
    task_definition_arn     = string 
    capacity_provider_strategy = optional(list(object({
      base              =  optional(number)
      capacity_provider = string
      weight            = optional(number)
    })), [])
    network_configuration = optional(list(object({
      assign_public_ip = optional(bool)
      subnets          = list(string)
      security_groups  = optional(list(string))
    })), [])
    ordered_placement_strategy = optional(list(object({
      field = optional(string)
      type  = string
    })), [])
    placement_constraint = optional(list(object({
      expression = optional(string)
      type       = string
    })), [])
  }))
  default     = []
}
variable "cloudwatch_event_target_http_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an API Gateway REST endpoint. A maximum of 1 is allowed"
  type        = list(object({
    header_parameters       = optional(map(string)) 
    path_parameter_values   = optional(list(string))
    query_string_parameters = optional(map(string))
  }))
  default     = []
}
variable "cloudwatch_event_target_input_transformer" {
  description = "(Optional) Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with input and input_path"
  type        = list(object({
    input_paths    = optional(map(string))
    input_template = string
  }))
  default     = []
}
variable "cloudwatch_event_target_kinesis_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. A maximum of 1 are allowed"
  type        = list(object({
    partition_key_path = optional(string)
  }))
  default     = []
}
variable "cloudwatch_event_target_redshift_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Redshift Statement. A maximum of 1 are allowed"
  type        = list(object({
    database            = string
    db_user             = optional(string)
    secrets_manager_arn = optional(string)
    sql                 = optional(string)
    statement_name      = optional(string)
    with_event          = optional(bool)
  }))
  default     = []
}
variable "cloudwatch_event_target_retry_policy" {
  description = "(Optional) Parameters used when you are providing retry policies. A maximum of 1 are allowed"
  type        = list(object({
    maximum_event_age_in_seconds = optional(number)
    maximum_retry_attempts       = optional(number)
  }))
  default     = []
}
variable "cloudwatch_event_target_run_command_targets" {
  description = "(Optional) Parameters used when you are using the rule to invoke Amazon EC2 Run Command. A maximum of 5 are allowed"
  type        = list(object({
    key    = string
    values = list(string)
  }))
  default     = []
}
variable "cloudwatch_event_target_sagemaker_pipeline_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon SageMaker Pipeline. A maximum of 1 are allowed"
  type        = list(object({
    pipeline_parameter_list = optional(list(object({
      name  = string
      value = string
    })), [])
  }))
  default     = []
}
variable "cloudwatch_event_target_sqs_target" {
  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon SQS Queue. A maximum of 1 are allowed"
  type        = list(object({
    message_group_id = optional(string)
  }))
  default     = []
}
