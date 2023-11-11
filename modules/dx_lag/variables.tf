variable "dx_lag_connection_id" {
  description = "The ID of an existing dedicated connection to migrate to the LAG"
  type        = string
  default     = null
}
variable "dx_lag_connections_bandwidth" {
  description = "The bandwidth of the individual physical connections bundled by the LAG. Valid values: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps and 100Gbps. Case sensitive"
  type        = string
}
variable "dx_lag_force_destroy" {
  description = "A boolean that indicates all connections associated with the LAG should be deleted so that the LAG can be destroyed without error. These objects are not recoverable"
  type        = bool
  default     = true
}
variable "dx_lag_location" {
  description = "The AWS Direct Connect location in which the LAG should be allocated. See DescribeLocations for the list of AWS Direct Connect locations. Use locationCode"
  type        = string
}
variable "dx_lag_name" {
  description = "The name of the LAG"
  type        = string
}
variable "dx_lag_provider_name" {
  description = "The name of the service provider associated with the LAG"
  type        = string
  default     = null
}
variable "dx_lag_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
