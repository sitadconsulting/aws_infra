output "ingress_security_group_rule_id" {
  description = "Ingress security group rule ID"
  value       = element(concat(aws_vpc_security_group_ingress_rule.vpc_security_group_ingress_rule.*.security_group_id, [""]), 0)
}
output "ingress_security_group_rule_arn" {
  description = "Ingress security group rule ARN"
  value       = element(concat(aws_vpc_security_group_ingress_rule.vpc_security_group_ingress_rule.*.arn, [""]), 0)
}

