resource "aws_cloudwatch_dashboard" "cloudwatch_dashboard" {
  dashboard_body = var.cloudwatch_dashboard_dashboard_body
  dashboard_name = var.cloudwatch_dashboard_dashboard_name
}
