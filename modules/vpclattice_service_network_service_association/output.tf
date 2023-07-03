output "vpclattice_service_network_service_association_arn" {
  description = "The ARN of the Association"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.arn, [""]), 0)
}
output "vpclattice_service_network_service_association_created_by" {
  description = "The account that created the association"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.created_by, [""]), 0)
}
output "vpclattice_service_network_service_association_custom_domain_name" {
  description = "The custom domain name of the service"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.custom_domain_name, [""]), 0)
}
output "vpclattice_service_network_service_association_dns_entry" {
  description = "The DNS name of the service"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.dns_entry, [""]), 0)
}
output "vpclattice_service_network_service_association_id" {
  description = "The ID of the association"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.id, [""]), 0)
}
output "vpclattice_service_network_service_association_status" {
  description = "The operations status. Valid Values are CREATE_IN_PROGRESS | ACTIVE | DELETE_IN_PROGRESS | CREATE_FAILED | DELETE_FAILED"
  value       = element(concat(aws_vpclattice_service_network_service_association.vpclattice_service_network_service_association.*.status, [""]), 0)
}
