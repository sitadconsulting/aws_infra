variable "vpc_block_public_access_exclusion_internet_gateway_exclusion_mode" {
  description = "(Required) Mode of exclusion from Block Public Access. The allowed values are allow-egress and allow-bidirectional"
  type        = string
}
variable "vpc_block_public_access_exclusion_subnet_id" {
  description = "(Optional) ID of the subnet to which this exclusion applies. Either this or the vpc_id needs to be provided"
  type        = string
  default     = null
}
variable "vpc_block_public_access_exclusion_tags" {
  description = "(Optional) Map of tags to assign to the exclusion"
  type        = map(string)
  default     = {}
}
variable "vpc_block_public_access_exclusion_vpc_id" {
  description = "(Optional) ID of the VPC to which this exclusion applies. Either this or the subnet_id needs to be provided"
  type        = string
  default     = null
}
