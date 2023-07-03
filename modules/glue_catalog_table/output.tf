output "glue_catalog_table_arn" {
  description = "ARN of the Glue Table"
  value       = element(concat(aws_glue_catalog_table.glue_catalog_table.*.arn, [""]), 0)
}
output "glue_catalog_table_id" {
  description = "Catalog ID, Database name and of the name table"
  value       = element(concat(aws_glue_catalog_table.glue_catalog_table.*.id, [""]), 0)
}
