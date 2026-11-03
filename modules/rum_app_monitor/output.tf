output "rum_app_monitor_arn" {
  description = "ARN specifying the app monitor"
  value       = element(concat(aws_rum_app_monitor.rum_app_monitor.*.arn, [""]), 0)
}
output "rum_app_monitor_id" {
  description = "The CloudWatch RUM name as it is the identifier of a RUM"
  value       = element(concat(aws_rum_app_monitor.rum_app_monitor.*.id, [""]), 0)
}
output "rum_app_monitor_app_monitor_id" {
  description = "The unique ID of the app monitor. Useful for JS templates"
  value       = element(concat(aws_rum_app_monitor.rum_app_monitor.*.app_monitor_id, [""]), 0)
}
output "rum_app_monitor_cw_log_group" {
  description = "The name of the log group where the copies are stored"
  value       = element(concat(aws_rum_app_monitor.rum_app_monitor.*.cw_log_group, [""]), 0)
}
