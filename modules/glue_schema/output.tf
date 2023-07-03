output "glue_schema_arn" {
  description = "ARN of the schema"
  value       = element(concat(aws_glue_schema.glue_schema.*.arn, [""]), 0)
}
output "glue_schema_id" {
  description = "ARN of the schema"
  value       = element(concat(aws_glue_schema.glue_schema.*.id, [""]), 0)
}
output "glue_schema_registry_name" {
  description = "The name of the Glue Registry"
  value       = element(concat(aws_glue_schema.glue_schema.*.registry_name, [""]), 0)
}
output "glue_schema_latest_schema_version" {
  description = "The latest version of the schema associated with the returned schema definition"
  value       = element(concat(aws_glue_schema.glue_schema.*.latest_schema_version, [""]), 0)
}
output "glue_schema_next_schema_version" {
  description = "The next version of the schema associated with the returned schema definition"
  value       = element(concat(aws_glue_schema.glue_schema.*.next_schema_version, [""]), 0)
}
output "glue_schema_schema_checkpoint" {
  description = "The version number of the checkpoint (the last time the compatibility mode was changed)"
  value       = element(concat(aws_glue_schema.glue_schema.*.schema_checkpoint, [""]), 0)
}
