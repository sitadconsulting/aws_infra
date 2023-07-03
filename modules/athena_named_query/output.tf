output "athena_named_query_id" {
  description = "Unique ID of the query"
  value       = element(concat(aws_athena_named_query.athena_named_query.*.id, [""]), 0)
}
