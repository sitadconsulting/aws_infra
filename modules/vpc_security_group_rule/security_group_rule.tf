resource "aws_security_group_rule" "security_group_rule" {
  cidr_blocks              = var.security_group_rule_cidr_blocks
  description              = var.security_group_rule_description
  from_port                = var.security_group_rule_from_port
  protocol                 = var.security_group_rule_protocol
  security_group_id        = var.security_group_rule_security_group_id
  source_security_group_id = var.security_group_rule_source_security_group_id
  to_port                  = var.security_group_rule_to_port
  type                     = var.security_group_rule_type
  prefix_list_ids          = var.security_group_rule_prefix_list_ids

  lifecycle {
    ignore_changes = all
  }
}

