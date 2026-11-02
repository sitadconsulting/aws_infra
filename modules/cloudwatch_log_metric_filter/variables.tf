variable "cloudwatch_log_metric_filter_apply_on_transformed_logs" {
  description = "(Optional) Whether the metric filter will be applied on the transformed version of the log events instead of the original ingested log events. Defaults to false. Valid only for log groups that have an active log transformer"
  type        = bool
  default     = false
}
variable "cloudwatch_log_metric_filter_log_group_name" {
  description = "(Required) The name of the log group to associate the metric filter with"
  type        = string
}
variable "cloudwatch_log_metric_filter_name" {
  description = "(Required) A name for the metric filter"
  type        = string
}
variable "cloudwatch_log_metric_filter_pattern" {
  description = "(Required) A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events"
  type        = string
}
variable "cloudwatch_log_metric_filter_metric_transformation" {
  description = "(Required) A block defining collection of information needed to define how metric data gets emitted"
  type        = list(object({
    default_value = optional(number)
    dimensions    = optional(map(string))
    name          = string
    namespace     = string
    unit          = optional(string)
    value         = string 
  }))
}
