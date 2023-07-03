output "instance_arn" {
  description = "ARN of the instance"
  value       = element(concat(aws_instance.instance.*.arn, [""]), 0)
}
output "instance_capacity_reservation_specification" {
  description = "Capacity reservation specification of the instance"
  value       = element(concat(aws_instance.instance.*.capacity_reservation_specification, [""]), 0)
}
output "instance_instance_state" {
  description = "State of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped"
  value       = element(concat(aws_instance.instance.*.instance_state, [""]), 0)
}
output "instance_outpost_arn" {
  description = "ARN of the Outpost the instance is assigned to"
  value       = element(concat(aws_instance.instance.*.outpost_arn, [""]), 0)
}
output "instance_password_data" {
  description = "Base-64 encoded encrypted password data for the instance"
  value       = element(concat(aws_instance.instance.*.password_data, [""]), 0)
}
output "instance_primary_network_interface_id" {
  description = "ID of the instance's primary network interface"
  value       = element(concat(aws_instance.instance.*.primary_network_interface_id, [""]), 0)
}
output "instance_private_dns" {
  description = "Private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.instance.*.private_dns, [""]), 0)
}
output "instance_public_dns" {
  description = "Public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = element(concat(aws_instance.instance.*.public_dns, [""]), 0)
}
output "instance_public_ip" {
  description = "Public IP address assigned to the instance, if applicable"
  value       = element(concat(aws_instance.instance.*.public_ip, [""]), 0)
}
