variable "autoscaling_policy_autoscaling_group_name" {
  description = "Name of the autoscaling group"
  type        = string
}
variable "autoscaling_policy_cooldown" {
  description = "Amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start"
  type        = number
  default     = null
}
variable "autoscaling_policy_enabled" {
  description = "Whether the scaling policy is enabled or disabled. Default: true"
  type        = bool
  default     = false
}
variable "autoscaling_policy_estimated_instance_warmup" {
  description = "Estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period"
  type        = number
  default     = null
}
variable "autoscaling_policy_metric_aggregation_type" {
  description = "Aggregation type for the policy's metrics. Valid values are \"Minimum\", \"Maximum\", and \"Average\". Without a value, AWS will treat the aggregation type as \"Average\""
  type        = string
  default     = ""
}
variable "autoscaling_policy_min_adjustment_magnitude" {
  description = "Minimum value to scale by when adjustment_type is set to PercentChangeInCapacity"
  type        = number
  default     = null
}
variable "autoscaling_policy_name" {
  description = "Name of the policy"
  type        = string
}
variable "autoscaling_policy_policy_type" {
  description = "Policy type, either \"SimpleScaling\", \"StepScaling\", \"TargetTrackingScaling\", or \"PredictiveScaling\". If this value isn't provided, AWS will default to \"SimpleScaling.\" "
  type        = string
  default     = ""
}
variable "autoscaling_policy_scaling_adjustment" {
  description = "Number of instances by which to scale. adjustment_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity"
  type        = number
  default     = null
}
variable "autoscaling_policy_predictive_scaling_configuration" {
  description = "Predictive scaling policy configuration to use with Amazon EC2 Auto Scaling"
  type        = list(object({
    max_capacity_breach_behavior = optional(string)
    max_capacity_buffer          = optional(number)
    mode                         = optional(string)
    scheduling_buffer_time       = optional(number)
    metric_specification = list(object({
      target_value = number
      customized_capacity_metric_specification = optional(list(object({
        metric_data_queries = list(object({
          expression  = optional(string)
          id          = string
          label       = optional(string)
          return_data = optional(bool)
          metric_stat = optional(list(object({
            stat = string
            unit = optional(string)
            metric = list(object({
              metric_name = string
              namespace   = string
              dimensions = optional(list(object({
                name  = string
                value = string
              })), [])
            }))
          })), [])
        }))
      })), [])
      customized_load_metric_specification = optional(list(object({
        metric_data_queries = list(object({
          expression  = optional(string)
          id          = string
          label       = optional(string)
          return_data = optional(bool)
          metric_stat = optional(list(object({
            stat = string
            unit = optional(string)
            metric = list(object({
              metric_name = string
              namespace   = string
              dimensions = optional(list(object({
                name  = string
                value = string
              })), [])
            }))
          })), [])
        }))
      })), [])
      customized_scaling_metric_specification = optional(list(object({
        metric_data_queries = list(object({
          expression  = optional(string)
          id          = string
          label       = optional(string)
          return_data = optional(bool)
          metric_stat = optional(list(object({
            stat = string
            unit = optional(string)
            metric = list(object({
              metric_name = string
              namespace   = string
              dimensions = optional(list(object({
                name  = string
                value = string
              })), [])
            }))
          })), [])
        }))
      })), [])
      predefined_load_metric_specification = optional(list(object({
        predefined_metric_type = string
        resource_label         = optional(string)
      })), [])
      predefined_metric_pair_specification = optional(list(object({
        predefined_metric_type = string
        resource_label         = optional(string)
      })), [])
      predefined_scaling_metric_specification = optional(list(object({
        predefined_metric_type = string
        resource_label         = optional(string)
      })), [])
    }))
  }))
  default     = []
}
variable "autoscaling_policy_step_adjustment" {
  description = "Set of adjustments that manage group scaling. These have the following structure"
  type        = list(object({
    metric_interval_lower_bound = optional(string)
    metric_interval_upper_bound = optional(string)
    scaling_adjustment          = number
  }))
  default     = []
}
variable "autoscaling_policy_target_tracking_configuration" {
  description = "Target tracking policy"
  type        = list(object({
    disable_scale_in = optional(bool)
    target_value     = number
    customized_metric_specification = optional(list(object({
      metric_name = optional(string)
      namespace   = optional(string)
      statistic   = optional(string)
      unit        = optional(string)
      metric_dimension = optional(list(object({
         name  = string
         value = string
      })), [])
      metrics         = optional(list(object({
        expression  = optional(string)
        id          = string
        label       = optional(string)
        return_data = optional(bool)
        metric_stat = optional(list(object({
          stat = string
          unit = optional(string)
          metric = list(object({
            metric_name = string
            namespace   = string
            dimensions = optional(list(object({
              name  = string
              value = string
            })), [])
          }))
        })), [])
      })), [])
    })), [])
    predefined_metric_specification = optional(list(object({
      predefined_metric_type = string
      resource_label         = optional(string)
    })), [])
  }))
  default     = []
}
