output "schemas_discoverer_arn" {
  description = "ARN of the discoverer"
  value       = element(concat(aws_schemas_discoverer.schemas_discoverer.*.arn, [""]), 0)
}
output "schemas_discoverer_id" {
  description = "The ID of the discoverer"
  value       = element(concat(aws_schemas_discoverer.schemas_discoverer.*.id, [""]), 0)
}
