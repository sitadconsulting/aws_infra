output "dx_gateway_association_proposal_id" {
  description = "Direct Connect Gateway Association Proposal identifier"
  value       = element(concat(aws_dx_gateway_association_proposal.dx_gateway_association_proposal.*.id, [""]), 0)
}
output "dx_gateway_association_proposal_associated_gateway_owner_account_id" {
  description = "The ID of the AWS account that owns the VGW or transit gateway with which to associate the Direct Connect gateway"
  value       = element(concat(aws_dx_gateway_association_proposal.dx_gateway_association_proposal.*.associated_gateway_owner_account_id, [""]), 0)
}
output "dx_gateway_association_proposal_associated_gateway_type" {
  description = "The type of the associated gateway, transitGateway or virtualPrivateGateway"
  value       = element(concat(aws_dx_gateway_association_proposal.dx_gateway_association_proposal.*.associated_gateway_type, [""]), 0)
}
