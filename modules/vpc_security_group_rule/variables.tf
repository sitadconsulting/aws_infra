variable "security_group_rule_cidr_blocks" {
  description = "List of CIDR blocks"
  type        = list(string)
  default     = null
}
variable "security_group_rule_description" {
  description = "The Description of the security group rule"
  type        = string
  default     = ""
}
variable "security_group_rule_from_port" {
  description = "The FROM_PORT to set for this security group rule"
  type        = number
}
variable "security_group_rule_prefix_list_ids" {
  description = "The PREFIX LIST IDS to set for this security group rule"
  type        = list(string)
  default     = null
}
variable "security_group_rule_protocol" {
  description = "The PROTOCOL to set for this security group rule"
  type        = string
}
variable "security_group_rule_security_group_id" {
  description = "The SECURITY GROUP ID to associate with this security group rule"
  type        = string
}
variable "security_group_rule_source_security_group_id" {
  description = "Security group id to allow access to/from, depending on the type"
  type        = string
  default     = null
}
variable "security_group_rule_to_port" {
  description = "The TO_PORT to set for this security group rule"
  type        = number
}
variable "security_group_rule_type" {
  description = "The RULE TYPE to set for this security group rule"
  type        = string
}
