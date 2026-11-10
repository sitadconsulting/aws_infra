output "connect_contact_flow_module_arn" {
  description = "ARN of the Contact Flow Module"
  value       = element(concat(aws_connect_contact_flow_module.connect_contact_flow_module.*.arn, [""]), 0)
}
output "connect_contact_flow_module_id" {
  description = "The identifier of the hosting Amazon Connect Instance and identifier of the Contact Flow Module separated by a colon (:)"
  value       = element(concat(aws_connect_contact_flow_module.connect_contact_flow_module.*.id, [""]), 0)
}
output "connect_contact_flow_module_contact_flow_module_id" {
  description = "The identifier of the Contact Flow Module"
  value       = element(concat(aws_connect_contact_flow_module.connect_contact_flow_module.*.contact_flow_module_id, [""]), 0)
}
