output "apigatewayv2_route_response_id" {
  description = "Route response identifier"
  value       = element(concat(aws_apigatewayv2_route_response.apigatewayv2_route_response.*.id, [""]), 0)
}

