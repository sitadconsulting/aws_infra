output "vpclattice_service_arn" {
  description = "ARN of the service"
  value       = element(concat(aws_vpclattice_service.vpclattice_service.*.arn, [""]), 0)
}
output "vpclattice_service_dns_entry" {
  description = "Service DNS Entry"
  value       = element(concat(aws_vpclattice_service.vpclattice_service.*.dns_entry, [""]), 0)
}
output "vpclattice_service_id" {
  description = "Service ID"
  value       = element(concat(aws_vpclattice_service.vpclattice_service.*.id, [""]), 0)
}
output "vpclattice_service_status" {
  description = "Service status"
  value       = element(concat(aws_vpclattice_service.vpclattice_service.*.status, [""]), 0)
}
