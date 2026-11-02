output "networkmonitor_probe_arn" {
  description = "Attachment ARN"
  value       = element(concat(aws_networkmonitor_probe.networkmonitor_probe.*.arn, [""]), 0)
}
output "networkmonitor_probe_source_arn" {
  description = "Subnet ARN"
  value       = element(concat(aws_networkmonitor_probe.networkmonitor_probe.*.source_arn, [""]), 0)
}
