variable "vpc_encryption_control_egress_only_internet_gateway_exclusion" {
  description = "(Optional) Whether to exclude Egress-Only Internet Gateways from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_elastic_file_system_exclusion" {
  description = "(Optional) Whether to exclude Elastic File System (EFS) from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_internet_gateway_exclusion" {
  description = "(Optional) Whether to exclude Internet Gateways from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_lambda_exclusion" {
  description = "(Optional) Whether to exclude Lambda Functions from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_mode" {
  description = "(Required) Mode to enable for VPC Encryption Control. Valid values are monitor or enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_nat_gateway_exclusion" {
  description = "(Optional) Whether to exclude NAT Gateways from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_encryption_control_virtual_private_gateway_exclusion" {
  description = "(Optional) Whether to exclude Virtual Private Gateways from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_vpc_id" {
  description = "(Required) ID of the VPC the VPC Encryption Control is linked to"
  type        = string
  default     = null
}
variable "vpc_encryption_control_vpc_lattice_exclusion" {
  description = "(Optional) Whether to exclude VPC Lattice from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
variable "vpc_encryption_control_vpc_peering_exclusion" {
  description = "(Optional) Whether to exclude peered VPCs from encryption enforcement. Valid values are disable or enable. Default is disable. Only valid when mode is enforce"
  type        = string
  default     = null
}
