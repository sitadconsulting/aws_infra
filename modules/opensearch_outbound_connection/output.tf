output "opensearch_outbound_connection_id" {
  description = "The Id of the connection to accept"
  value       = element(concat(aws_opensearch_outbound_connection.opensearch_outbound_connection.*.id, [""]), 0)
}
output "opensearch_outbound_connection_connection_status" {
  description = "Status of the connection request"
  value       = element(concat(aws_opensearch_outbound_connection.opensearch_outbound_connection.*.connection_status, [""]), 0)
}
