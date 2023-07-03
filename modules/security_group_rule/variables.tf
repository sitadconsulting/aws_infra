variable "security_group_rule_cidr_blocks" {
  description = "List of CIDR blocks. Cannot be specified with source_security_group_id or self"
  type        = list(string)
  default     = null
}
variable "security_group_rule_description" {
  description = "Description of the rule"
  type        = string
  default     = ""
}
variable "security_group_rule_from_port" {
  description = "Start port (or ICMP type number if protocol is \"icmp\" or \"icmpv6\")"
  type        = number
}
variable "security_group_rule_ipv6_cidr_blocks" {
  description = "List of IPv6 CIDR blocks. Cannot be specified with source_security_group_id or self"
  type        = list(string)
  default     = null
}
variable "security_group_rule_prefix_list_ids" {
  description = "List of Prefix List IDs"
  type        = list(string)
  default     = null
}
variable "security_group_rule_protocol" {
  description = "Protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
  type        = string
}
variable "security_group_rule_security_group_id" {
  description = "Security group to apply this rule to"
  type        = string
}
variable "security_group_rule_self" {
  description = "Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id"
  type        = bool
  default     = null
}
variable "security_group_rule_source_security_group_id" {
  description = "Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self"
  type        = string
  default     = null
}
variable "security_group_rule_to_port" {
  description = "End port (or ICMP code if protocol is \"icmp\")"
  type        = number
}
variable "security_group_rule_type" {
  description = "Type of rule being created. Valid options are ingress (inbound) or egress (outbound)"
  type        = string
}
