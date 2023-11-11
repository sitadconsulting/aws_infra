output "dx_private_virtual_interface_id" {
  description = "Private virtual interface ID"
  value       = element(concat(aws_dx_private_virtual_interface.dx_private_virtual_interface.*.id, [""]), 0)
}
output "dx_private_virtual_interface_arn" {
  description = "Private virtual interface arn"
  value       = element(concat(aws_dx_private_virtual_interface.dx_private_virtual_interface.*.arn, [""]), 0)
}
output "dx_private_virtual_interface_aws_device" {
  description = "The Direct Connect endpoint on which the private virtual interface terminates"
  value       = element(concat(aws_dx_private_virtual_interface.dx_private_virtual_interface.*.aws_device, [""]), 0)
}
output "dx_private_virtual_interface_jumbo_frame_capable" {
  description = "Indicates whether jumbo frames (9001 MTU) are supported"
  value       = element(concat(aws_dx_private_virtual_interface.dx_private_virtual_interface.*.jumbo_frame_capable, [""]), 0)
}
