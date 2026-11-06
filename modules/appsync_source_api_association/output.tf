output "appsync_source_api_association_arn" {
  description = "ARN of the Source API Association"
  value       = element(concat(aws_appsync_source_api_association.appsync_source_api_association.*.arn, [""]), 0)
}
output "appsync_source_api_association_association_id" {
  description = "ID of the Source API Association"
  value       = element(concat(aws_appsync_source_api_association.appsync_source_api_association.*.association_id, [""]), 0)
}
output "appsync_source_api_association_id" {
  description = "Combined ID of the Source API Association and Merge API"
  value       = element(concat(aws_appsync_source_api_association.appsync_source_api_association.*.id, [""]), 0)
}
