variable "datasync_agent_activation_key" {
  description = "(Optional) DataSync Agent activation key during resource creation. Conflicts with ip_address. If an ip_address is provided instead, Terraform will retrieve the activation_key as part of the resource creation"
  type        = string
  default     = null
}
variable "datasync_agent_ip_address" {
  description = "(Optional) DataSync Agent IP address to retrieve activation key during resource creation. Conflicts with activation_key. DataSync Agent must be accessible on port 80 from where Terraform is running"
  type        = string
  default     = null
}
variable "datasync_agent_name" {
  description = "(Required) Name of the DataSync Agent"
  type        = string
}
variable "datasync_agent_private_link_endpoint" {
  description = "(Optional) The IP address of the VPC endpoint the agent should connect to when retrieving an activation key during resource creation. Conflicts with activation_key"
  type        = string
  default     = null
}
variable "datasync_agent_security_group_arns" {
  description = "(Optional) The ARNs of the security groups used to protect your data transfer task subnets"
  type        = list(string)
  default     = null
}
variable "datasync_agent_subnet_arns" {
  description = "(Optional) ARNs of the subnets in which DataSync will create elastic network interfaces for each data transfer task"
  type        = list(string)
  default     = null
}
variable "datasync_agent_tags" {
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Agent"
  type        = map(string)
  default     = {}
}
variable "datasync_agent_vpc_endpoint_id" {
  description = "(Optional) ID of the VPC endpoint that the agent has access to"
  type        = string
  default     = null
}
