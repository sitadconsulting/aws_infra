output "vpc_security_group_egress_rule_arn" {
  description = "ARN of the security group rule"
  value       = element(concat(aws_vpc_security_group_egress_rule.vpc_security_group_egress_rule.*.arn, [""]), 0)
}
output "vpc_security_group_egress_rule_security_group_rule_id" {
  description = "ID of the security group rule"
  value       = element(concat(aws_vpc_security_group_egress_rule.vpc_security_group_egress_rule.*.security_group_id, [""]), 0)
}
