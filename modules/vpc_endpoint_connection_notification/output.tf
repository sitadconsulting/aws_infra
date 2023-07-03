output "vpc_endpoint_connection_notification_id" {
  description = "The ID of the VPC connection notification"
  value       = element(concat(aws_vpc_endpoint_connection_notification.vpc_endpoint_connection_notification.*.id, [""]), 0)
}
output "vpc_endpoint_connection_notification_state" {
  description = "The state of the notification"
  value       = element(concat(aws_vpc_endpoint_connection_notification.vpc_endpoint_connection_notification.*.state, [""]), 0)
}
output "vpc_endpoint_connection_notification_notification_type" {
  description = "The type of notification"
  value       = element(concat(aws_vpc_endpoint_connection_notification.vpc_endpoint_connection_notification.*.notification_type, [""]), 0)
}
