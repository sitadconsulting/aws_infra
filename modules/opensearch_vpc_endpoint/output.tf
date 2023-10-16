output "opensearch_vpc_endpoint_id" {
  description = "The unique identifier of the endpoint"
  value       = element(concat(aws_opensearch_vpc_endpoint.opensearch_vpc_endpoint.*.id, [""]), 0)
}
output "opensearch_vpc_endpoint_endpoint" {
  description = "The connection endpoint ID for connecting to the domain"
  value       = element(concat(aws_opensearch_vpc_endpoint.opensearch_vpc_endpoint.*.endpoint, [""]), 0)
}
