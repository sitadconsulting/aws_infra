output "glue_registry_arn" {
  description = "ARN of Glue Registry"
  value       = element(concat(aws_glue_registry.glue_registry.*.arn, [""]), 0)
}
output "glue_registry_id" {
  description = "ARN of Glue Registry"
  value       = element(concat(aws_glue_registry.glue_registry.*.id, [""]), 0)
}
