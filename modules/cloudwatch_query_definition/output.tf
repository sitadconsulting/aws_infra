output "cloudwatch_query_definition_arn" {
  description = "Query definition ARN"
  value       = element(concat(aws_cloudwatch_query_definition.cloudwatch_query_definition.*.arn, [""]), 0)
}
output "cloudwatch_query_definition_query_definition_id" {
  description = "The query definition ID"
  value       = element(concat(aws_cloudwatch_query_definition.cloudwatch_query_definition.*.query_definition_id, [""]), 0)
}
