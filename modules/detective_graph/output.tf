output "detective_graph_created_time" {
  description = "Date and time, in UTC and extended RFC 3339 format, when the Amazon Detective Graph was created"
  value       = element(concat(aws_detective_graph.detective_graph.*.created_time, [""]), 0)
}
output "detective_graph_graph_arn" {
  description = "ARN of the Detective Graph"
  value       = element(concat(aws_detective_graph.detective_graph.*.graph_arn, [""]), 0)
}
