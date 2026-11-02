output "networkflowmonitor_monitor_monitor_arn" {
  description = "ARN of the monitor"
  value       = element(concat(aws_networkflowmonitor_monitor.networkflowmonitor_monitor.*.monitor_arn, [""]), 0)
}
