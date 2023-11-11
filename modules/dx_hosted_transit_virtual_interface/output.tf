output "dx_hosted_transit_virtual_interface_id" {
  description = "Transit virtual interface ID"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface.dx_hosted_transit_virtual_interface.*.id, [""]), 0)
}
output "dx_hosted_transit_virtual_interface_arn" {
  description = "Transit virtual interface ARN"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface.dx_hosted_transit_virtual_interface.*.arn, [""]), 0)
}
output "dx_hosted_transit_virtual_interface_aws_device" {
  description = "The Direct Connect endpoint on which the transit virtual interface terminates"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface.dx_hosted_transit_virtual_interface.*.aws_device, [""]), 0)
}
output "dx_hosted_transit_virtual_interface_jumbo_frame_capable" {
  description = "Indicates whether jumbo frames (8500 MTU) are supported"
  value       = element(concat(aws_dx_hosted_transit_virtual_interface.dx_hosted_transit_virtual_interface.*.jumbo_frame_capable, [""]), 0)
}
