variable "network_interface_attachment_instance_id" {
  description = "(Required) Instance ID to attach"
  type        = string
}
variable "network_interface_attachment_network_interface_id" {
  description = "(Required) ENI ID to attach"
  type        = string
}
variable "network_interface_attachment_device_index" {
  description = "(Required) Network interface index (int)"
  type        = number
  default     = null
}
variable "network_interface_attachment_network_card_index" {
  description = " (Optional) Index of the network card. Specify a value greater than 0 when using multiple network cards, which are supported by some instance types. The default is 0"
  type        = number
  default     = null
}
