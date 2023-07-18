variable "vpc_endpoint_connection_notification_vpc_endpoint_service_id" {
  description = "The ID of the VPC Endpoint Service to receive notifications for"
  type        = string
  default     = null
}
variable "vpc_endpoint_connection_notification_vpc_endpoint_id" {
  description = "The ID of the VPC Endpoint to receive notifications for"
  type        = string
  default     = null
}
variable "vpc_endpoint_connection_notification_connection_notification_arn" {
  description = "The ARN of the SNS topic for the notifications"
  type        = string
}
variable "vpc_endpoint_connection_notification_connection_events" {
  description = "One or more endpoint events for which to receive notifications"
  type        = list(string)
  default     = null
}
