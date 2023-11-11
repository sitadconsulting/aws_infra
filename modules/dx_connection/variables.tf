variable "dx_connection_bandwidth" {
  description = "The bandwidth of the connection. Valid values for dedicated connections: 1Gbps, 10Gbps. Valid values for hosted connections: 50Mbps, 100Mbps, 200Mbps, 300Mbps, 400Mbps, 500Mbps, 1Gbps, 2Gbps, 5Gbps, 10Gbps and 100Gbps. Case sensitive"
  type        = string
}
variable "dx_connection_encryption_mode" {
  description = "The connection MAC Security (MACsec) encryption mode. MAC Security (MACsec) is only available on dedicated connections. Valid values are no_encrypt, should_encrypt, and must_encrypt"
  type        = string
  default     = null
}
variable "dx_connection_location" {
  description = "The AWS Direct Connect location where the connection is located. See DescribeLocations for the list of AWS Direct Connect locations. Use locationCode"
  type        = string
}
variable "dx_connection_request_macsec" {
  description = "Boolean value indicating whether you want the connection to support MAC Security (MACsec). MAC Security (MACsec) is only available on dedicated connections. See MACsec prerequisites for more information about MAC Security (MACsec) prerequisites. Default value: false"
  type        = bool
  default     = false
}
variable "dx_connection_name" {
  description = "The name of the connection"
  type        = string
}
variable "dx_connection_provider_name" {
  description = "The name of the service provider associated with the connection"
  type        = string
  default     = ""
}
variable "dx_connection_skip_destroy" {
  description = "Set to true if you do not wish the connection to be deleted at destroy time, and instead just removed from the Terraform state"
  type        = bool
  default     = false
}
variable "dx_connection_tags" {
  description = "A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
