variable "ec2_instance_connect_endpoint_ip_address_type" {
  description = "(Optional) IP address type of the endpoint. Valid values are ipv4, ipv6, and dualstack. The default value is determined by the IP address type of the subnet"
  type        = string
  default     = null
}
variable "ec2_instance_connect_endpoint_preserve_client_ip" {
  description = "(Optional) Indicates whether your client's IP address is preserved as the source. Default: true"
  type        = bool
  default     = true
}
variable "ec2_instance_connect_endpoint_security_group_ids" {
  description = "(Optional) One or more security groups to associate with the endpoint. If you don't specify a security group, the default security group for the VPC will be associated with the endpoint"
  type        = list(string)
  default     = []
}
variable "ec2_instance_connect_endpoint_subnet_id" {
  description = "(Required) The ID of the subnet in which to create the EC2 Instance Connect Endpoint"
  type        = string
}
variable "ec2_instance_connect_endpoint_tags" {
  description = "(Optional) Map of tags to assign to this resource"
  type        = map(string)
  default     = {}
}
