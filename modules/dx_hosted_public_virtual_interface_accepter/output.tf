output "dx_hosted_public_virtual_interface_accepter_id" {
  description = "Public virtual interface accepter ID"
  value       = element(concat(aws_dx_hosted_public_virtual_interface_accepter.dx_hosted_public_virtual_interface_accepter.*.id, [""]), 0)
}
output "dx_hosted_public_virtual_interface_accepter_arn" {
  description = "Public virtual interface accepter ARN"
  value       = element(concat(aws_dx_hosted_public_virtual_interface_accepter.dx_hosted_public_virtual_interface_accepter.*.arn, [""]), 0)
}
