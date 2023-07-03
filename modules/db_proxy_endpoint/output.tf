output "db_proxy_endpoint_id" {
  description = "The name of the proxy and proxy endpoint separated by /, DB-PROXY-NAME/DB-PROXY-ENDPOINT-NAME"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.id, [""]), 0)
}
output "db_proxy_endpoint_arn" {
  description = "ARN for the proxy endpoint"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.id, [""]), 0)
}
output "db_proxy_endpoint_endpoint" {
  description = "The endpoint that you can use to connect to the proxy. You include the endpoint value in the connection string for a database client application"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.endpoint, [""]), 0)
}
output "db_proxy_endpoint_is_default" {
  description = "Indicates whether this endpoint is the default endpoint for the associated DB proxy"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.is_default, [""]), 0)
}
output "db_proxy_endpoint_vpc_id" {
  description = "The VPC ID of the DB proxy endpoint"
  value       = element(concat(aws_db_proxy_endpoint.db_proxy_endpoint.*.vpc_id, [""]), 0)
}
