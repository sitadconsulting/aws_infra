output "connect_contact_flow_arn" {
  description = "ARN of the Contact Flow"
  value       = element(concat(aws_connect_contact_flow.connect_contact_flow.*.arn, [""]), 0)
}
output "connect_contact_flow_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Contact Flow separated by a colon (:)"
  value       = element(concat(aws_connect_contact_flow.connect_contact_flow.*.id, [""]), 0)
}
output "connect_contact_flow_contact_flow_id" {
  description = "The identifier of the Contact Flow"
  value       = element(concat(aws_connect_contact_flow.connect_contact_flow.*.contact_flow_id, [""]), 0)
}
