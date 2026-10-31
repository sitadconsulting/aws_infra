variable "cloudwatch_resource_metrics_configuration_resource_arn" {
  description = "(Required) ARN of the AWS resource to enable detailed monitoring for. Changing this forces a new resource to be created"
  type        = string
}
variable "cloudwatch_resource_metrics_configuration_metric_selection" {
  description = "(Optional) Configuration block that limits which metrics CloudWatch collects. At most one block is supported. When omitted, CloudWatch collects all available detailed metrics for the resource"
  type        = list(object({
    include_metrics = list(string)
  }))
  default     = []
}
