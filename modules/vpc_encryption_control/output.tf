output "vpc_encryption_control_id" {
  description = "ID of the VPC Encryption Control"
  value       = element(concat(aws_vpc_encryption_control.vpc_encryption_control.*.id, [""]), 0)
}
output "vpc_encryption_control_resource_exclusions" {
  description = "State of exclusions from encryption enforcement. Will be nil if mode is monitor"
  value       = element(concat(aws_vpc_encryption_control.vpc_encryption_control.*.resource_exclusions, [""]), 0)
}
output "vpc_encryption_control_state" {
  description = "Current state of the VPC Encryption Control"
  value       = element(concat(aws_vpc_encryption_control.vpc_encryption_control.*.state, [""]), 0)
}
output "vpc_encryption_control_state_message" {
  description = "Message providing additional information about the state of the VPC Encryption Control"
  value       = element(concat(aws_vpc_encryption_control.vpc_encryption_control.*.state_message, [""]), 0)
}
