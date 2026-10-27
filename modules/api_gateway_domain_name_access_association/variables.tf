variable "api_gateway_domain_name_access_association_access_association_source" {
  description = "(Required) Identifier of the domain name access association source. For a VPCE, the value is the VPC endpoint ID"
  type        = string
}
variable "api_gateway_domain_name_access_association_access_association_source_type" {
  description = "(Required) Type of the domain name access association source. Valid values are VPCE"
  type        = string
  default     = "VPCE"
}
variable "api_gateway_domain_name_access_association_domain_name_arn" {
  description = "(Required) ARN of the domain name"
  type        = string
}
variable "api_gateway_domain_name_access_association_tags" {
  description = "(Optional) Key-value map of resource tags"
  type        = map(string)
  default     = {}
}
