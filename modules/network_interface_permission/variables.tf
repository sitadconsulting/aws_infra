variable "network_interface_permission_aws_account_id" {
  description = "(Required) The Amazon Web Services account ID"
  type        = string
}
variable "network_interface_permission_network_interface_id" {
  description = "(Required) The ID of the network interface"
  type        = string
}
variable "network_interface_permission_permission" {
  description = "(Required) The type of permission to grant. Valid values are INSTANCE-ATTACH or EIP-ASSOCIATE"
  type        = string
}
