output "networkmonitor_monitor_arn" {
  description = "ARN of the monitor"
  value       = element(concat(aws_networkmonitor_monitor.networkmonitor_monitor.*.arn, [""]), 0)
}
