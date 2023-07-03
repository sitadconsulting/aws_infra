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
variable "network_interface_tags" {
  description = "Additional tags for this network interface"
  type        = map(string)
  default     = {}
}
variable "network_interface_description" {
  description = "Description for the network interface"
  type        = string
  default     = ""
}
variable "network_interface_subnet_id" {
  description = "Subnet ID to create the ENI in"
  type        = string
  default     = ""
}
variable "network_interface_security_groups" {
  description = "List of security group IDs to assign to the ENI"
  type        = list
  default     = []
}
