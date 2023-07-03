output "vpc_endpoint_service_allowed_principal_id" {
  description = "The ID of the association"
  value       = element(concat(aws_vpc_endpoint_service_allowed_principal.vpc_endpoint_service_allowed_principal.*.id, [""]), 0)
}
