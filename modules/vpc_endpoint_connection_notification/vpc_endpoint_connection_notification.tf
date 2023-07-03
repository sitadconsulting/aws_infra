resource "aws_vpc_endpoint_connection_notification" "vpc_endpoint_connection_notification" {
  vpc_endpoint_service_id     = var.vpc_endpoint_connection_notification_vpc_endpoint_service_id
  vpc_endpoint_id             = var.vpc_endpoint_connection_notification_vpc_endpoint_id
  connection_notification_arn = var.vpc_endpoint_connection_notification_connection_notification_arn
  connection_events           = var.vpc_endpoint_connection_notification_connection_events
}
