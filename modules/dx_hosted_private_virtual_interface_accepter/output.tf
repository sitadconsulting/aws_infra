output "dx_hosted_private_virtual_interface_accepter_id" {
  description = "Virtual interface accepter ID"
  value       = element(concat(aws_dx_hosted_private_virtual_interface_accepter.dx_hosted_private_virtual_interface_accepter.*.id, [""]), 0)
}
output "dx_hosted_private_virtual_interface_accepter_arn" {
  description = "Virtual interface accepter ARN"
  value       = element(concat(aws_dx_hosted_private_virtual_interface_accepter.dx_hosted_private_virtual_interface_accepter.*.arn, [""]), 0)
}
