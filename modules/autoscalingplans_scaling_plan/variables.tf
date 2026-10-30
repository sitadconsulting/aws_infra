variable "autoscalingplans_scaling_plan_name" {
  description = "(Required) Name of the scaling plan. Names cannot contain vertical bars, colons, or forward slashes"
  type        = string
}
variable "autoscalingplans_scaling_plan_application_source" {
  description = "(Required) CloudFormation stack or set of tags. You can create one scaling plan per application source"
  type        = list(object({
    cloudformation_stack_arn = optional(string)
    tag_filter               = optional(list(object({
      key    = string
      values = optional(list(string))
    })), [])
  }))
}
variable "autoscalingplans_scaling_plan_scaling_instruction" {
  description = "(Required) Scaling instructions"
  type        = list(object({
    disable_dynamic_scaling                  = optional(bool)
    max_capacity                             = number
    min_capacity                             = number
    predictive_scaling_max_capacity_behavior = optional(string)
    predictive_scaling_max_capacity_buffer   = optional(number)
    predictive_scaling_mode                  = optional(string)
    resource_id                              = string
    scalable_dimension                       = string
    service_namespace                        = optional(string)
    scaling_policy_update_behavior           = optional(string)
    scheduled_action_buffer_time             = optional(number)
    customized_load_metric_specification     = optional(list(object({
      dimensions  = optional(map(string))
      metric_name = string
      namespace   = string
      statistic   = string
      unit        = optional(string)
    })), [])
    predefined_load_metric_specification    = optional(list(object({
      predefined_load_metric_type = string
      resource_label              = optional(string)
    })), [])
    target_tracking_configuration           = optional(list(object({
      disable_scale_in                        = optional(bool)
      estimated_instance_warmup               = optional(number)
      scale_in_cooldown                       = optional(number)
      scale_out_cooldown                      = optional(number)
      target_value                            = number
      customized_scaling_metric_specification = optional(list(object({
        dimensions  = optional(map(string))
        metric_name = string
        namespace   = string
        statistic   = string
        unit        = optional(string)
      })), [])
      predefined_scaling_metric_specification = optional(list(object({
        predefined_scaling_metric_type = string
        resource_label                 = optional(string)
      })), [])
    })), [])
  }))
}
