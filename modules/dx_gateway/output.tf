output "dx_gateway_id" {
  description = "Gateway ID"
  value       = element(concat(aws_dx_gateway.dx_gateway.*.id, [""]), 0)
}
output "dx_gateway_owner_account_id" {
  description = "AWS Account ID of the gateway"
  value       = element(concat(aws_dx_gateway.dx_gateway.*.owner_account_id, [""]), 0)
}
