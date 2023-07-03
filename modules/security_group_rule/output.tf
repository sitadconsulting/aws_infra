output "security_group_rule_id" {
  description = "ID of the security group rule"
  value       = element(concat(aws_security_group_rule.security_group_rule.*.id, [""]), 0)
}
