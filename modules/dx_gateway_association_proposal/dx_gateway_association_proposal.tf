resource "aws_dx_gateway_association_proposal" "dx_gateway_association_proposal" {
  allowed_prefixes            = var.dx_gateway_association_proposal_allowed_prefixes
  associated_gateway_id       = var.dx_gateway_association_proposal_associated_gateway_id
  dx_gateway_id               = var.dx_gateway_association_proposal_dx_gateway_id
  dx_gateway_owner_account_id = var.dx_gateway_association_proposal_dx_gateway_owner_account_id 
}
