resource "aws_rum_metrics_destination" "rum_metrics_destination" {
  app_monitor_name = var.rum_metrics_destination_app_monitor_name
  destination      = var.rum_metrics_destination_destination
  destination_arn  = var.rum_metrics_destination_destination_arn
  iam_role_arn     = var.rum_metrics_destination_iam_role_arn
}
