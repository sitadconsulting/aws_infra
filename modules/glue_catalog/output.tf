output "glue_catalog_arn" {
  description = "ARN of the Glue Catalog"
  value       = element(concat(aws_glue_catalog.glue_catalog.*.arn, [""]), 0)
}
output "glue_catalog_id" {
  description = "ID of the parent catalog"
  value       = element(concat(aws_glue_catalog.glue_catalog.*.id, [""]), 0)
}
output "glue_catalog_create_time" {
  description = "Time at which the catalog was created"
  value       = element(concat(aws_glue_catalog.glue_catalog.*.create_time, [""]), 0)
}
output "glue_catalog_update_time" {
  description = "Time at which the catalog was last updated"
  value       = element(concat(aws_glue_catalog.glue_catalog.*.update_time, [""]), 0)
}
