output "athena_prepared_statement_id" {
  description = "ID of the prepared statement"
  value       = element(concat(aws_athena_prepared_statement.athena_prepared_statement.*.id, [""]), 0)
}
