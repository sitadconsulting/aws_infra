output "egress_security_group_rule_id" {
  description = "Egress security group rule ID"
  value       = element(concat(aws_vpc_security_group_egress_rule.vpc_security_group_egress_rule.*.security_group_id, [""]), 0)
}
output "egress_security_group_rule_arn" {
  description = "Egress security group rule ARN"
  value       = element(concat(aws_vpc_security_group_egress_rule.vpc_security_group_egress_rule.*.arn, [""]), 0)
}

