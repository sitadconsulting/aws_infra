output "dx_hosted_transit_virtual_interface_accepter_id" {
  description = "Transit virtual interface accepter ID"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface_accepter.dx_hosted_transit_virtual_interface_accepter.*.id, [""]), 0)
}
output "dx_hosted_transit_virtual_interface_accepter_arn" {
  description = "Transit virtual interface accepter ARN"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface_accepter.dx_hosted_transit_virtual_interface_accepter.*.arn, [""]), 0)
}
