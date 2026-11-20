output "schemas_schema_arn" {
  description = "ARN of the schema"
  value       = element(concat(aws_schemas_schema.schemas_schema.*.arn, [""]), 0)
}
output "schemas_schema_last_modified" {
  description = "The last modified date of the schema"
  value       = element(concat(aws_schemas_schema.schemas_schema.*.last_modified, [""]), 0)
}
output "schemas_schema_version" {
  description = "The version of the schema"
  value       = element(concat(aws_schemas_schema.schemas_schema.*.version, [""]), 0)
}
output "schemas_schema_version_created_date" {
  description = "The created date of the version of the schema"
  value       = element(concat(aws_schemas_schema.schemas_schema.*.version_created_date, [""]), 0)
}
