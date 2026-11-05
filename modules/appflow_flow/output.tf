output "appflow_flow_arn" {
  description = "Flow's ARN"
  value       = element(concat(aws_appflow_flow.appflow_flow.*.arn, [""]), 0)
}
output "appflow_flow_status" {
  description = "Current status of the flow"
  value       = element(concat(aws_appflow_flow.appflow_flow.*.status, [""]), 0)
}
