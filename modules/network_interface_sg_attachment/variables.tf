variable "network_interface_sg_attachment_network_interface_id" {
  description = "(Required) The ID of the network interface to attach to"
  type        = string
}
variable "network_interface_sg_attachment_security_group_id" {
  description = " (Required) The ID of the security group"
  type        = string
}
