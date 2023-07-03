output "vpc_endpoint_security_group_association_id" {
  description = "The ID of the association"
  value       = element(concat(aws_vpc_endpoint_security_group_association.vpc_endpoint_security_group_association.*.id, [""]), 0)
}
