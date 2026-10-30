output "cloudwatch_dashboard_dashboard_arn" {
  description = "ARN of the dashboard"
  value       = element(concat(aws_cloudwatch_dashboard.cloudwatch_dashboard.*.dashboard_arn, [""]), 0)
}
