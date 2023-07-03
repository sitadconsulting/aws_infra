output "opensearchserverless_vpc_endpoint_id" {
  description = "Unique identified of the Vpc Endpoint"
  value       = element(concat(aws_opensearchserverless_vpc_endpoint.opensearchserverless_vpc_endpoint.*.id, [""]), 0)
}
