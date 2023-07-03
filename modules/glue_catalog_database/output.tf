output "glue_catalog_database_arn" {
  description = "ARN of the Glue Catalog Database"
  value       = element(concat(aws_glue_catalog_database.glue_catalog_database.*.arn, [""]), 0)
}
output "glue_catalog_database_id" {
  description = "Catalog ID and name of the database"
  value       = element(concat(aws_glue_catalog_database.glue_catalog_database.*.id, [""]), 0)
}
