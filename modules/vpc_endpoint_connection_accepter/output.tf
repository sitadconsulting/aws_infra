output "vpc_endpoint_state" {
  description = "State of the VPC Endpoint"
  value       = element(concat(aws_vpc_endpoint_connection_accepter.vpc_endpoint_connection_accepter.*.vpc_endpoint_state, [""]), 0)
}
output "vpc_endpoint_id" {
  description = "The ID of the VPC Endpoint Connection"
  value       = element(concat(aws_vpc_endpoint_connection_accepter.vpc_endpoint_connection_accepter.*.id, [""]), 0)
}
