variable "dx_gateway_association_allowed_prefixes" {
  description = "VPC prefixes (CIDRs) to advertise to the Direct Connect gateway. Defaults to the CIDR block of the VPC associated with the Virtual Gateway. To enable drift detection, must be configured"
  type        = list(string)
  default     = []
}
variable "dx_gateway_association_associated_gateway_id" {
  description = "The ID of the VGW or transit gateway with which to associate the Direct Connect gateway. Used for single account Direct Connect gateway associations"
  type        = string
  default     = null

}
variable "dx_gateway_association_associated_gateway_owner_account_id" {
  description = "The ID of the AWS account that owns the VGW or transit gateway with which to associate the Direct Connect gateway. Used for cross-account Direct Connect gateway associations"
  type        = string
  default     = null

}
variable "dx_gateway_association_dx_gateway_id" {
  description = "The ID of the Direct Connect gateway"
  type        = string
}
variable "dx_gateway_association_proposal_id" {
  description = "The ID of the Direct Connect gateway association proposal. Used for cross-account Direct Connect gateway associations"
  type        = string
  default     = null

}
