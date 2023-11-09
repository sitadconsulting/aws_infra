output "apigatewayv2_api_id" {
  description = "API identifier"
  value       = element(concat(aws_apigatewayv2_api.apigatewayv2_api.*.id, [""]), 0)
}
output "apigatewayv2_api_api_endpoint" {
  description = "URI of the API, of the form https://{api-id}.execute-api.{region}.amazonaws.com for HTTP APIs and wss://{api-id}.execute-api.{region}.amazonaws.com for WebSocket APIs"
  value       = element(concat(aws_apigatewayv2_api.apigatewayv2_api.*.api_endpoint, [""]), 0)
}
output "apigatewayv2_api_arn" {
  description = "ARN of the API"
  value       = element(concat(aws_apigatewayv2_api.apigatewayv2_api.*.arn, [""]), 0)
}
output "apigatewayv2_api_execution_arn" {
  description = "ARN prefix to be used in an aws_lambda_permission's source_arn attribute or in an aws_iam_policy to authorize access to the @connections API. See the Amazon API Gateway Developer Guide for details"
  value       = element(concat(aws_apigatewayv2_api.apigatewayv2_api.*.execution_arn, [""]), 0)
}
output "apigatewayv2_api_tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block"
  value       = element(concat(aws_apigatewayv2_api.apigatewayv2_api.*.tags_all, [""]), 0)
}
