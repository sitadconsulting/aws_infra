output "db_proxy_arn" {
  description = "DB proxy ARN"
  value       = element(concat(aws_db_proxy.db_proxy.*.arn, [""]), 0)
}
output "db_proxy_endpoint" {
  description = "The endpoint that you can use to connect to the proxy. You include the endpoint value in the connection string for a database client application"
  value       = element(concat(aws_db_proxy.db_proxy.*.endpoint, [""]), 0)
}
