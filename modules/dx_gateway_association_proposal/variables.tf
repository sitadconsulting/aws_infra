variable "dx_gateway_association_proposal_allowed_prefixes" {
  description = "(Optional) VPC prefixes (CIDRs) to advertise to the Direct Connect gateway. Defaults to the CIDR block of the VPC associated with the Virtual Gateway. To enable drift detection, must be configured"
  type        = list(string)
  default     = null
}
variable "dx_gateway_association_proposal_associated_gateway_id" {
  description = "(Required) The ID of the VGW or transit gateway with which to associate the Direct Connect gateway"
  type        = string
}
variable "dx_gateway_association_proposal_dx_gateway_id" {
  description = "(Required) Direct Connect Gateway identifier"
  type        = string
}
variable "dx_gateway_association_proposal_dx_gateway_owner_account_id" {
  description = "(Required) AWS Account identifier of the Direct Connect Gateway's owner"
  type        = string
}
