output "apigatewayv2_stage_id" {
  description = "Stage identifier"
  value       = element(concat(aws_apigatewayv2_stage.apigatewayv2_stage.*.id, [""]), 0)
}
output "apigatewayv2_stage_arn" {
  description = "Stage ARN"
  value       = element(concat(aws_apigatewayv2_stage.apigatewayv2_stage.*.arn, [""]), 0)
}
output "apigatewayv2_stage_execution_arn" {
  description = "ARN prefix to be used in an aws_lambda_permission's source_arn attribute. For WebSocket APIs this attribute can additionally be used in an aws_iam_policy to authorize access to the @connections API. See the Amazon API Gateway Developer Guide for details"
  value       = element(concat(aws_apigatewayv2_stage.apigatewayv2_stage.*.execution_arn, [""]), 0)
}
output "apigatewayv2_stage_invoke_url" {
  description = "URL to invoke the API pointing to the stage, e.g., wss://z4675bid1j.execute-api.eu-west-2.amazonaws.com/example-stage, or https://z4675bid1j.execute-api.eu-west-2.amazonaws.com/"
  value       = element(concat(aws_apigatewayv2_stage.apigatewayv2_stage.*.invoke_url, [""]), 0)
}
