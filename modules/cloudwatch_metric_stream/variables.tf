variable "cloudwatch_metric_stream_firehose_arn" {
  description = "(Required) ARN of the Amazon Kinesis Firehose delivery stream to use for this metric stream"
  type        = string
}
variable "cloudwatch_metric_stream_include_linked_accounts_metrics" {
  description = "(Optional) If you are creating a metric stream in a monitoring account, specify true to include metrics from source accounts that are linked to this monitoring account, in the metric stream. The default is false"
  type        = bool
  default     = false
}
variable "cloudwatch_metric_stream_name" {
  description = "(Optional, Forces new resource) Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "cloudwatch_metric_stream_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "cloudwatch_metric_stream_output_format" {
  description = "(Required) Output format for the stream. Possible values are json, opentelemetry0.7, and opentelemetry1.0"
  type        = string
}
variable "cloudwatch_metric_stream_role_arn" {
  description = "(Required) ARN of the IAM role that this metric stream will use to access Amazon Kinesis Firehose resources"
  type        = string
}
variable "cloudwatch_metric_stream_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "cloudwatch_metric_stream_exclude_filter" {
  description = "(Optional) List of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces and the conditional metric names that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is excluded. Conflicts with include_filter"
  type        = list(object({
    metric_names = optional(list(string))
    namespace    = string
  }))
  default     = []
}
variable "cloudwatch_metric_stream_include_filter" {
  description = "(Optional) List of inclusive metric filters. If you specify this parameter, the stream sends only the conditional metric names from the metric namespaces that you specify here. If you don't specify metric names or provide empty metric names whole metric namespace is included. Conflicts with exclude_filter"
  type        = list(object({
    metric_names = optional(list(string))
    namespace    = string
  }))
  default     = []
}
variable "cloudwatch_metric_stream_statistics_configuration" {
  description = "(Optional) For each entry in this array, you specify one or more metrics and the list of additional statistics to stream for those metrics. The additional statistics that you can stream depend on the stream's output_format. If the OutputFormat is json, you can stream any additional statistic that is supported by CloudWatch, listed in CloudWatch statistics definitions. If the OutputFormat is opentelemetry0.7 or opentelemetry1.0, you can stream percentile statistics (p99 etc.)"
  type        = list(object({
    additional_statistics = list(string)
    include_metric        = list(object({
      metric_names = string
      namespace    = string
    })) 
  }))
  default     = []
}
