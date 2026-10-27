variable "vpc_security_group_rules_exclusive_egress_rule_ids" {
  description = "(Required) Egress rule IDs"
  type        = string
}
variable "vpc_security_group_rules_exclusive_ingress_rule_ids" {
  description = "(Required) Ingress rule IDs"
  type        = string
}
variable "vpc_security_group_rules_exclusive_security_group_id" {
  description = "(Required, Forces new resource) ID of the security group"
  type        = string
}
