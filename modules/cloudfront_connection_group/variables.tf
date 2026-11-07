variable "cloudfront_connection_group_anycast_ip_list_id" {
  description = "(Optional) - ID of the associated Anycast IP List. ipv6_enabled must not be set to true in order to set this argument"
  type        = string
  default     = null
}
variable "cloudfront_connection_group_enabled" {
  description = "(Optional) - Whether the connection group is enabled. Default is true"
  type        = bool
  default     = true
}
variable "cloudfront_connection_group_ipv6_enabled" {
  description = "(Optional) - Whether IPv6 is enabled for the connection group. Default is false"
  type        = bool
  default     = false
}
variable "cloudfront_connection_group_name" {
  description = "(Required) - Name of the connection group"
  type        = string
}
variable "cloudfront_connection_group_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
