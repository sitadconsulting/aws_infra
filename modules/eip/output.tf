output "eip_allocation_id" {
  description = "ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC"
  value       = element(concat(aws_eip.eip.*.allocation_id, [""]), 0)
}
output "eip_association_id" {
  description = "ID representing the association of the address with an instance in a VPC"
  value       = element(concat(aws_eip.eip.*.association_id, [""]), 0)
}
output "eip_carrier_ip" {
  description = "Carrier IP address"
  value       = element(concat(aws_eip.eip.*.carrier_ip, [""]), 0)
}
output "eip_customer_owned_ip" {
  description = "Customer owned IP"
  value       = element(concat(aws_eip.eip.*.customer_owned_ip, [""]), 0)
}
output "eip_id" {
  description = "Contains the EIP allocation ID"
  value       = element(concat(aws_eip.eip.*.id, [""]), 0)
}
output "eip_private_dns" {
  description = "The Private DNS associated with the Elastic IP address (if in VPC)"
  value       = element(concat(aws_eip.eip.*.private_dns, [""]), 0)
}
output "eip_private_ip" {
  description = "Contains the private IP address (if in VPC)"
  value       = element(concat(aws_eip.eip.*.private_ip, [""]), 0)
}
output "eip_public_dns" {
  description = "The public dns name associated with this EIP"
  value       = element(concat(aws_eip.eip.*.public_dns, [""]), 0)
}
output "eip_public_ip" {
  description = "Contains the public IP address"
  value       = element(concat(aws_eip.eip.*.public_ip, [""]), 0)
}
