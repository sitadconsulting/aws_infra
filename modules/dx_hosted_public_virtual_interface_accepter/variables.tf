variable "dx_hosted_public_virtual_interface_accepter_virtual_interface_id" {
  description = "The ID of the Direct Connect virtual interface to accept"
  type        = string
}
variable "dx_hosted_public_virtual_interface_accepter_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
