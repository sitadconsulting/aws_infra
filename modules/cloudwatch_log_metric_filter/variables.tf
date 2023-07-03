variable "cloudwatch_log_metric_filter_log_group_name" {
  description = "The name of the log group to associate the metric filter with"
  type        = string
}
variable "cloudwatch_log_metric_filter_name" {
  description = "A name for the metric filter"
  type        = string
}
variable "cloudwatch_log_metric_filter_pattern" {
  description = "A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events"
  type        = string
}
variable "cloudwatch_log_metric_filter_metric_transformation" {
  description = "A block defining collection of information needed to define how metric data gets emitted"
  type        = list(object({
    default_value = optional(number)
    dimensions    = optional(map(string))
    name          = string
    namespace     = string
    unit          = optional(string)
    value         = string 
  }))
}
