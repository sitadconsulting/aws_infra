variable "dx_hosted_connection_bandwidth" {
  description = "The bandwidth of the connection. Valid values for dedicated connections: 1Gbps, 10Gbps. Valid values for hosted connections: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps and 10Gbps. Case sensitive"
  type        = string
}
variable "dx_hosted_connection_connection_id" {
  description = "The ID of the interconnect or LAG"
  type        = string
}
variable "dx_hosted_connection_name" {
  description = "The name of the connection"
  type        = string
}
variable "dx_hosted_connection_owner_account_id" {
  description = "The ID of the AWS account of the customer for the connection"
  type        = string
}
variable "dx_hosted_connection_vlan" {
  description = "The dedicated VLAN provisioned to the hosted connection"
  type        = number
}
