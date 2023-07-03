output "quicksight_namespace_arn" {
  description = "ARN of the Namespace"
  value       = element(concat(aws_quicksight_namespace.quicksight_namespace.*.arn, [""]), 0)
}
output "quicksight_namespace_capacity_region" {
  description = "Namespace AWS Region"
  value       = element(concat(aws_quicksight_namespace.quicksight_namespace.*.capacity_region, [""]), 0)
}
output "quicksight_namespace_creation_status" {
  description = "Creation status of the namespace"
  value       = element(concat(aws_quicksight_namespace.quicksight_namespace.*.creation_status, [""]), 0)
}
output "quicksight_namespace_id" {
  description = "A comma-delimited string joining AWS account ID and namespace"
  value       = element(concat(aws_quicksight_namespace.quicksight_namespace.*.id, [""]), 0)
}

