resource "aws_vpc_security_group_rules_exclusive" "vpc_security_group_rules_exclusive" {
  egress_rule_ids   = var.vpc_security_group_rules_exclusive_egress_rule_ids
  ingress_rule_ids  = var.vpc_security_group_rules_exclusive_ingress_rule_ids
  security_group_id = var.vpc_security_group_rules_exclusive_security_group_id
}
