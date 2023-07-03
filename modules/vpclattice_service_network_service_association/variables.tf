variable "vpclattice_service_network_service_association_service_identifier" {
  description = "The ID or Amazon Resource Identifier (ARN) of the service"
  type        = string
}
variable "vpclattice_service_network_service_association_service_network_identifier" {
  description = "The ID or Amazon Resource Identifier (ARN) of the service network. You must use the ARN if the resources specified in the operation are in different accounts"
  type        = string
}
variable "vpclattice_service_network_service_association_tags" {
  description = "Key-value mapping of resource tags"
  type        = map(string)
  default     = {}
}
