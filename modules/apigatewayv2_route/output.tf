output "apigatewayv2_route_id" {
  description = "Route identifier"
  value       = element(concat(aws_apigatewayv2_route.apigatewayv2_route.*.id, [""]), 0)
}

