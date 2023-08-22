variable "vpc_security_group_ingress_rule_cidr_ipv4" {
  description = "The source IPv4 CIDR range"
  type        = string
  default     = null
}
variable "vpc_security_group_ingress_rule_cidr_ipv6" {
  description = "The source IPv6 CIDR range"
  type        = string
  default     = null
}
variable "vpc_security_group_ingress_rule_description" {
  description = "The security group rule description"
  type        = string
  default     = ""
}
variable "vpc_security_group_ingress_rule_from_port" {
  description = "The start of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 type"
  type        = number
  default     = null
}
variable "vpc_security_group_ingress_rule_ip_protocol" {
  description = "The IP protocol name or number. Use -1 to specify all protocols"
  type        = string
}
variable "vpc_security_group_ingress_rule_prefix_list_id" {
  description = "The ID of the source prefix list"
  type        = string
  default     = null
}
variable "vpc_security_group_ingress_rule_referenced_security_group_id" {
  description = "The source security group that is referenced in the rule"
  type        = string
  default     = null
}
variable "vpc_security_group_ingress_rule_security_group_id" {
  description = "The ID of the security group"
  type        = string
}
variable "vpc_security_group_ingress_rule_to_port" {
  description = "The end of port range for the TCP and UDP protocols, or an ICMP/ICMPv6 code"
  type        = number
  default     = null
}
variable "vpc_security_group_ingress_rule_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
