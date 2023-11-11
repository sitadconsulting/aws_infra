resource "aws_dx_gateway_association" "dx_gateway_association" {
  allowed_prefixes                    = var.dx_gateway_association_allowed_prefixes
  associated_gateway_id               = var.dx_gateway_association_associated_gateway_id
  associated_gateway_owner_account_id = var.dx_gateway_association_associated_gateway_owner_account_id
  dx_gateway_id                       = var.dx_gateway_association_dx_gateway_id
  proposal_id                         = var.dx_gateway_association_proposal_id
}
