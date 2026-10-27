output "vpc_route_server_endpoint_arn" {
  description = "ARN of the route server endpoint"
  value       = element(concat(aws_vpc_route_server_endpoint.vpc_route_server_endpoint.*.arn, [""]), 0)
}
output "vpc_route_server_eni_address" {
  description = "IP address of the Elastic network interface for the endpoint"
  value       = element(concat(aws_vpc_route_server_endpoint.vpc_route_server_endpoint.*.eni_address, [""]), 0)
}
output "vpc_route_server_eni_id" {
  description = "ID of the Elastic network interface for the endpoint"
  value       = element(concat(aws_vpc_route_server_endpoint.vpc_route_server_endpoint.*.eni_id, [""]), 0)
}
output "vpc_route_server_route_server_endpoint_id" {
  description = "Unique identifier of the route server endpoint"
  value       = element(concat(aws_vpc_route_server_endpoint.vpc_route_server_endpoint.*.route_server_endpoint_id, [""]), 0)
}
output "vpc_route_server_vpc_id" {
  description = "ID of the VPC containing the endpoint"
  value       = element(concat(aws_vpc_route_server_endpoint.vpc_route_server_endpoint.*.vpc_id, [""]), 0)
}
