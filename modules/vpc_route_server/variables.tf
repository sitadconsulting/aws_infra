variable "vpc_route_server_amazon_side_asn" {
  description = "(Required) Border Gateway Protocol (BGP) Autonomous System Number (ASN) for the appliance. Valid values are from 1 to 4294967295"
  type        = number
  default     = null
}
variable "vpc_route_server_persist_routes" {
  description = "(Optional) Whether routes should be persisted after all BGP sessions are terminated. Valid values are enable, disable, reset"
  type        = string
  default     = null
}
variable "vpc_route_server_persist_routes_duration" {
  description = "(Optional) Number of minutes a route server will wait after BGP is re-established to unpersist the routes in the FIB and RIB. Value must be in the range of 1-5. Required if persist_routes is enabled"
  type        = number
  default     = null
}
variable "vpc_route_server_sns_notifications_enabled" {
  description = "(Optional) Whether to enable SNS notifications for route server events. Enabling SNS notifications persists BGP status changes to an SNS topic provisioned by AWS "
  type        = bool
  default     = null
}
variable "vpc_route_server_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
