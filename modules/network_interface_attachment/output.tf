output "network_interface_attachment_instance_id" {
  description = "Instance ID"
  value       = element(concat(aws_network_interface_attachment.network_interface_attachment.*.instance_id, [""]), 0)
}
output "network_interface_attachment_network_interface_id" {
  description = "Network interface ID"
  value       = element(concat(aws_network_interface_attachment.network_interface_attachment.*.network_interface_id, [""]), 0)
}
output "network_interface_attachment_attachment_id" {
  description = "The ENI Attachment ID"
  value       = element(concat(aws_network_interface_attachment.network_interface_attachment.*.attachment_id, [""]), 0)
}
output "network_interface_attachment_status" {
  description = "The status of the Network Interface Attachment"
  value       = element(concat(aws_network_interface_attachment.network_interface_attachment.*.status, [""]), 0)
}
