output "apigatewayv2_routing_rule_routing_rule_arn" {
  description = "ARN of the Routing Rule"
  value       = element(concat(aws_apigatewayv2_routing_rule.apigatewayv2_routing_rule.*.routing_rule_arn, [""]), 0)
}
output "apigatewayv2_routing_rule_routing_rule_id" {
  description = "ID of the Routing Rule"
  value       = element(concat(aws_apigatewayv2_routing_rule.apigatewayv2_routing_rule.*.routing_rule_id, [""]), 0)
}
