output "opensearch_inbound_connection_accepter_id" {
  description = "The Id of the connection to accept"
  value       = element(concat(aws_opensearch_inbound_connection_accepter.opensearch_inbound_connection_accepter.*.id, [""]), 0)
}
output "opensearch_inbound_connection_accepter_connection_status" {
  description = "Status of the connection request"
  value       = element(concat(aws_opensearch_inbound_connection_accepter.opensearch_inbound_connection_accepter.*.connection_status, [""]), 0)
}
