variable "dx_lag_connection_id" {
  description = "(Optional) The ID of an existing dedicated connection to migrate to the LAG"
  type        = string
  default     = null
}
variable "dx_lag_connections_bandwidth" {
  description = "(Required) The bandwidth of the individual dedicated connections bundled by the LAG. Valid values: 1Gbps, 10Gbps, 100Gbps, and 400Gbps. Case sensitive. Refer to the AWS Direct Connection supported bandwidths for Dedicated Connections"
  type        = string
}
variable "dx_lag_force_destroy" {
  description = "(Optional, Default:false) A boolean that indicates all connections associated with the LAG should be deleted so that the LAG can be destroyed without error. These objects are not recoverable"
  type        = bool
  default     = false
}
variable "dx_lag_location" {
  description = "(Required) The AWS Direct Connect location in which the LAG should be allocated. See DescribeLocations for the list of AWS Direct Connect locations. Use locationCode"
  type        = string
}
variable "dx_lag_name" {
  description = "(Required) The name of the LAG"
  type        = string
}
variable "dx_lag_provider_name" {
  description = "(Optional) The name of the service provider associated with the LAG"
  type        = string
  default     = null
}
variable "dx_lag_tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
