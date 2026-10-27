output "vpc_security_group_ingress_rule_arn" {
  description = "Ingress security group rule ARN"
  value       = element(concat(aws_vpc_security_group_ingress_rule.vpc_security_group_ingress_rule.*.arn, [""]), 0)
}
output "vpc_security_group_ingress_rule_security_group_rule_id" {
  description = "ID of the security group rule"
  value       = element(concat(aws_vpc_security_group_ingress_rule.vpc_security_group_ingress_rule.*.security_group_rule_id, [""]), 0)
}

