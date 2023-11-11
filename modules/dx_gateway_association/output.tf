output "dx_gateway_association_id" {
  description = "The ID of the Direct Connect gateway association resource"
  value       = element(concat(aws_dx_gateway_association.dx_gateway_association.*.id, [""]), 0)
}
output "dx_gateway_association_associated_gateway_type" {
  description = "The type of the associated gateway, transitGateway or virtualPrivateGateway"
  value       = element(concat(aws_dx_gateway_association.dx_gateway_association.*.associated_gateway_type, [""]), 0)
}
output "dx_gateway_association_dx_gateway_association_id" {
  description = "The ID of the Direct Connect gateway association"
  value       = element(concat(aws_dx_gateway_association.dx_gateway_association.*.dx_gateway_association_id, [""]), 0)
}
output "dx_gateway_association_dx_gateway_owner_account_id" {
  description = "The ID of the AWS account that owns the Direct Connect gateway"
  value       = element(concat(aws_dx_gateway_association.dx_gateway_association.*.dx_gateway_owner_account_id, [""]), 0)
}
