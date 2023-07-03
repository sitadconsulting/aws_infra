variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "sitadinfra"
}
variable "environment" {
  description = "The name of the environment"
  type        = string
  default     = "DEV"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "dhcp_options_association_vpc_id" {
  description = "The ID of the VPC this DHCP_OPTIONS set is associated with"
  type        = string
}
variable "dhcp_options_association_dhcp_options_id" {
  description = "The ID of the DHCP_OPTIONS set to be associated"
  type        = string
}
