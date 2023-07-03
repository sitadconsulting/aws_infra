output "vpc_endpoint_subnet_association_id" {
  description = "The ID of the association"
  value       = element(concat(aws_vpc_endpoint_subnet_association.vpc_endpoint_subnet_association.*.id, [""]), 0)
}
