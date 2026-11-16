variable "dx_hosted_connection_bandwidth" {
  description = "(Required) The bandwidth of the connection. Valid values for dedicated connections: 1Gbps, 10Gbps. Valid values for hosted connections: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps, and 25Gbps. Case sensitive. Refer to the AWS Direct Connection supported bandwidths for Hosted Connections"
  type        = string
}
variable "dx_hosted_connection_connection_id" {
  description = "(Required) The ID of the interconnect or LAG"
  type        = string
}
variable "dx_hosted_connection_name" {
  description = "(Required) The name of the connection"
  type        = string
}
variable "dx_hosted_connection_owner_account_id" {
  description = "(Required) The ID of the AWS account of the customer for the connection"
  type        = string
}
variable "dx_hosted_connection_vlan" {
  description = "(Required) The dedicated VLAN provisioned to the hosted connection"
  type        = number
}
