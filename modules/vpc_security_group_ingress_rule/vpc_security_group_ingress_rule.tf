resource "aws_vpc_security_group_ingress_rule" "vpc_security_group_ingress_rule" {
  cidr_ipv4                    = var.vpc_security_group_ingress_rule_cidr_ipv4
  cidr_ipv6                    = var.vpc_security_group_ingress_rule_cidr_ipv6
  description                  = var.vpc_security_group_ingress_rule_description
  from_port                    = var.vpc_security_group_ingress_rule_from_port
  ip_protocol                  = var.vpc_security_group_ingress_rule_ip_protocol
  prefix_list_id               = var.vpc_security_group_ingress_rule_prefix_list_id
  referenced_security_group_id = var.vpc_security_group_ingress_rule_referenced_security_group_id
  security_group_id            = var.vpc_security_group_ingress_rule_security_group_id
  to_port                      = var.vpc_security_group_ingress_rule_to_port
  tags                         = var.vpc_security_group_ingress_rule_tags

  lifecycle {
    ignore_changes = all
  }
}
