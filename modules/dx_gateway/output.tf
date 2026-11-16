output "dx_gateway_arn" {
  description = "The ARN of the gateway"
  value       = element(concat(aws_dx_gateway.dx_gateway.*.arn, [""]), 0)
}
output "dx_gateway_id" {
  description = "The ID of the gateway"
  value       = element(concat(aws_dx_gateway.dx_gateway.*.id, [""]), 0)
}
output "dx_gateway_owner_account_id" {
  description = "AWS Account ID of the gateway"
  value       = element(concat(aws_dx_gateway.dx_gateway.*.owner_account_id, [""]), 0)
}
