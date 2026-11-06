output "appsync_graphql_api_arn" {
  description = "ARN of the Api key"
  value       = element(concat(aws_appsync_graphql_api.appsync_graphql_api.*.arn, [""]), 0)
}
output "appsync_graphql_api_id" {
  description = "Unique AWS AppSync GraphQL API identifier"
  value       = element(concat(aws_appsync_graphql_api.appsync_graphql_api.*.id, [""]), 0)
}
output "appsync_graphql_api_uris" {
  description = "Map of URIs associated with the API E.g., uris[\"GRAPHQL\"] = https://ID.appsync-api.REGION.amazonaws.com/graphql"
  value       = element(concat(aws_appsync_graphql_api.appsync_graphql_api.*.uris, [""]), 0)
}
