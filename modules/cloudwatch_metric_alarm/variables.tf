variable "cloudwatch_metric_alarm_actions_enabled" {
  description = "(Optional) Indicates whether or not actions should be executed during any changes to the alarm's state. Defaults to true"
  type        = bool
  default     = true
}
variable "cloudwatch_metric_alarm_alarm_actions" {
  description = "(Optional) List of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an ARN"
  type        = list(string)
  default     = null
}
variable "cloudwatch_metric_alarm_alarm_description" {
  description = "(Optional) The description for the alarm"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_alarm_name" {
  description = "(Required) The descriptive name for the alarm. This name must be unique within the user's AWS account"
  type        = string
}
variable "cloudwatch_metric_alarm_comparison_operator" {
  description = "(Optional) The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_datapoints_to_alarm" {
  description = "(Optional) The number of data points that must be breaching to trigger the alarm"
  type        = number
  default     = null
}
variable "cloudwatch_metric_alarm_dimensions" {
  description = "(Optional) The dimensions for the alarm's associated metric"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_metric_alarm_evaluate_low_sample_count_percentiles" {
  description = "(Optional) Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_evaluation_interval" {
  description = "(Optional) The frequency, in seconds, at which the alarm is evaluated. Valid values are 10, 20, 30, and any multiple of 60. Required when using evaluation_criteria"
  type        = number
  default     = null
}
variable "cloudwatch_metric_alarm_evaluation_periods" {
  description = "(Optional) The number of periods over which data is compared to the specified threshold. Required for traditional metric alarms"
  type        = number
  default     = null
}
variable "cloudwatch_metric_alarm_extended_statistic" {
  description = "(Optional) The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_insufficient_data_actions" {
  description = "(Optional) List of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an ARN "
  type        = list(string)
  default     = null
}
variable "cloudwatch_metric_alarm_metric_name" {
  description = "(Optional) The name for the alarm's associated metric"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_namespace" {
  description = "(Optional) The namespace for the alarm's associated metric"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_ok_actions" {
  description = "(Optional) List of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an ARN"
  type        = list(string)
  default     = null
}
variable "cloudwatch_metric_alarm_period" {
  description = "(Optional) The period in seconds over which the specified statistic is applied. Valid values are 10, 20, 30, or any multiple of 60"
  type        = number
  default     = null
}
variable "cloudwatch_metric_alarm_statistic" {
  description = "(Optional) The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_metric_alarm_threshold" {
  description = "(Optional) The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models"
  type        = number
  default     = null
}
variable "cloudwatch_metric_alarm_threshold_metric_id" {
  description = "(Optional) If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_treat_missing_data" {
  description = "(Optional) Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_unit" {
  description = "(Optional) The unit for the alarm's associated metric"
  type        = string
  default     = null
}
variable "cloudwatch_metric_alarm_evaluation_criteria" {
  description = "(Optional) The evaluation criteria for PromQL alarms. Cannot be used with traditional metric alarm parameters"
  type        = list(object({
    promql_criteria = list(object({
      pending_period  = optional(number)
      query           = string
      recovery_period = optional(string)
    }))
  }))
  default     = []
}
variable "cloudwatch_metric_alarm_evaluation_window" {
  description = "(Optional) Configures the alarm to use a wall clock evaluation window instead of the default sliding window. Not supported for alarms that use evaluation_criteria"
  type        = list(object({
    wall_clock_window = list(object({
      timezone = optional(string)
    }))
  }))
  default     = []
}
variable "cloudwatch_metric_alarm_metric_query" {
  description = "(Optional) Enables you to create an alarm based on a metric math expression. You may specify at most 20"
  type        = list(object({
    account_id  = optional(string)
    expression  = optional(string)
    id          = string
    label       = optional(string)
    period      = optional(number)
    return_data = optional(bool)
    metric      = optional(list(object({
      dimensions  = optional(map(string))
      metric_name = string 
      namespace   = optional(string)
      period      = number
      stat        = string
      unit        = optional(string)
    })), [])
  }))
  default     = []
}
variable "cloudwatch_metric_alarm_warm_up_configuration" {
  description = "(Optional) Warm-up period that delays alarm evaluation after the alarm is created. During the warm-up period the alarm stays in INSUFFICIENT_DATA and does not perform alarm actions"
  type        = list(object({
    only_start_evaluating_after_warm_up_period_ends = optional(bool)
    warm_up_period_duration_in_minutes              = number
  }))
  default     = []
}
