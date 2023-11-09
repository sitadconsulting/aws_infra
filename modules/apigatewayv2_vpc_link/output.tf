output "apigatewayv2_vpc_link_id" {
  description = "VPC Link identifier"
  value       = element(concat(aws_apigatewayv2_vpc_link.apigatewayv2_vpc_link.*.id, [""]), 0)
}
output "apigatewayv2_vpc_link_arn" {
  description = "VPC Link ARN"
  value       = element(concat(aws_apigatewayv2_vpc_link.apigatewayv2_vpc_link.*.arn, [""]), 0)
}
