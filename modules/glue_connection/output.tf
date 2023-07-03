output "glue_connection_id" {
  description = "Catalog ID and name of the connection"
  value       = element(concat(aws_glue_connection.glue_connection.*.id, [""]), 0)
}
output "glue_connection_arn" {
  description = "ARN of the Glue Connection"
  value       = element(concat(aws_glue_connection.glue_connection.*.arn, [""]), 0)
}
