variable "vpc_security_group_egress_rule_cidr_ipv4" {
  description = "(Optional) Destination IPv4 CIDR range"
  type        = string
  default     = null
}
variable "vpc_security_group_egress_rule_cidr_ipv6" {
  description = "(Optional) Destination IPv6 CIDR range"
  type        = string
  default     = null
}
variable "vpc_security_group_egress_rule_description" {
  description = "(Optional) Security group rule description"
  type        = string
  default     = null
}
variable "vpc_security_group_egress_rule_from_port" {
  description = "(Optional) Start of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type"
  type        = number
  default     = null
}
variable "vpc_security_group_egress_rule_ip_protocol" {
  description = "(Required) IP protocol name or number. Use -1 to specify all protocols. Note that if ip_protocol is set to -1, it translates to all protocols, all port ranges, and from_port and to_port values should not be defined"
  type        = string
}
variable "vpc_security_group_egress_rule_prefix_list_id" {
  description = "(Optional) ID of the destination prefix list"
  type        = string
  default     = null
}
variable "vpc_security_group_egress_rule_referenced_security_group_id" {
  description = "(Optional) Destination security group that is referenced in the rule"
  type        = string
  default     = null
}
variable "vpc_security_group_egress_rule_security_group_id" {
  description = "(Required) ID of the security group"
  type        = string
}
variable "vpc_security_group_egress_rule_tags" {
  description = "(Optional) Map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "vpc_security_group_egress_rule_to_port" {
  description = "(Optional) End of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code"
  type        = number
  default     = null
}
