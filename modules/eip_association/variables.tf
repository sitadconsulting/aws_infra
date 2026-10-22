variable "eip_association_allocation_id" {
  description = "(Optional, Forces new resource) ID of the associated Elastic IP. This argument is required despite being optional at the resource level due to legacy support for EC2-Classic networking"
  type        = string
  default     = null
}
variable "eip_association_allow_reassociation" {
  description = "(Optional, Forces new resource) Whether to allow an Elastic IP address to be re-associated. Defaults to true"
  type        = bool
  default     = null
}
variable "eip_association_instance_id" {
  description = "(Optional, Forces new resource) ID of the instance. The instance must have exactly one attached network interface. You can specify either the instance ID or the network interface ID, but not both"
  type        = string
  default     = null
}
variable "eip_association_network_interface_id" {
  description = "(Optional, Forces new resource) ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID. You can specify either the instance ID or the network interface ID, but not both"
  type        = string
  default     = null
}
variable "eip_association_private_ip_address" {
  description = "(Optional, Forces new resource) Primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  type        = string
  default     = null
}
