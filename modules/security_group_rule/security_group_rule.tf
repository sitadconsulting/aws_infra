resource "aws_security_group_rule" "security_group_rule" {
  cidr_blocks              = var.security_group_rule_cidr_blocks
  description              = var.security_group_rule_description
  from_port                = var.security_group_rule_from_port
  ipv6_cidr_blocks         = var.security_group_rule_ipv6_cidr_blocks
  prefix_list_ids          = var.security_group_rule_prefix_list_ids
  protocol                 = var.security_group_rule_protocol
  security_group_id        = var.security_group_rule_security_group_id
  self                     = var.security_group_rule_self
  source_security_group_id = var.security_group_rule_source_security_group_id
  to_port                  = var.security_group_rule_to_port
  type                     = var.security_group_rule_type
}
