output "athena_database_id" {
  description = "Database name"
  value       = element(concat(aws_athena_database.athena_database.*.id, [""]), 0)
}
