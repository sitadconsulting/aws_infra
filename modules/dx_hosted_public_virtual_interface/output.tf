output "dx_hosted_public_virtual_interface_id" {
  description = "Public virtual interface ID"
  value       = element(concat(aws_dx_hosted_public_virtual_interface.dx_hosted_public_virtual_interface.*.id, [""]), 0)
}
output "dx_hosted_public_virtual_interface_arn" {
  description = "Public virtual interface ARN"
  value       = element(concat(aws_dx_hosted_public_virtual_interface.dx_hosted_public_virtual_interface.*.arn, [""]), 0)
}
output "dx_hosted_public_virtual_interface_aws_device" {
  description = "The Direct Connect endpoint on which the public virtual interface terminates"
  value       = element(concat(aws_dx_hosted_public_virtual_interface.dx_hosted_public_virtual_interface.*.aws_device, [""]), 0)
}
