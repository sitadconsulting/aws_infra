variable "prometheus_query_logging_configuration_workspace_id" {
  description = "(Required) The ID of the AMP workspace for which to configure query logging"
  type        = string
}
variable "prometheus_query_logging_configuration_destination" {
  description = "(Required) Configuration block for the logging destinations"
  type        = list(object({
    cloudwatch_logs = list(object({
      log_group_arn = string
    }))
    filters         = list(object({
      qsp_threshold = number
    }))
  }))
}
