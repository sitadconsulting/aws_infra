variable "rum_metrics_destination_app_monitor_name" {
  description = "(Required) The name of the CloudWatch RUM app monitor that will send the metrics"
  type        = string
}
variable "rum_metrics_destination_destination" {
  description = "(Required) Defines the destination to send the metrics to. Valid values are CloudWatch and Evidently. If you specify Evidently, you must also specify the ARN of the CloudWatchEvidently experiment that is to be the destination and an IAM role that has permission to write to the experiment"
  type        = string
}
variable "rum_metrics_destination_destination_arn" {
  description = "(Optional) Use this parameter only if Destination is Evidently. This parameter specifies the ARN of the Evidently experiment that will receive the extended metrics"
  type        = string
  default     = null
}
variable "rum_metrics_destination_iam_role_arn" {
  description = "(Optional) This parameter is required if Destination is Evidently. If Destination is CloudWatch, do not use this parameter"
  type        = string
  default     = null
}
