output "internetmonitor_monitor_arn" {
  description = "ARN of the Monitor"
  value       = element(concat(aws_internetmonitor_monitor.internetmonitor_monitor.*.arn, [""]), 0)
}
output "internetmonitor_monitor_id" {
  description = "Name of the monitor"
  value       = element(concat(aws_internetmonitor_monitor.internetmonitor_monitor.*.id, [""]), 0)
}
