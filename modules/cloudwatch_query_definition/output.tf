output "cloudwatch_query_definition_query_definition_id" {
  description = "The query definition ID"
  value       = element(concat(aws_cloudwatch_query_definition.cloudwatch_query_definition.*.query_definition_id, [""]), 0)
}
