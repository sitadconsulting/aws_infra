output "athena_data_catalog_id" {
  description = "Name of the data catalog"
  value       = element(concat(aws_athena_data_catalog.athena_data_catalog.*.id, [""]), 0)
}
output "athena_data_catalog_arn" {
  description = "ARN of the data catalog"
  value       = element(concat(aws_athena_data_catalog.athena_data_catalog.*.arn, [""]), 0)
}
