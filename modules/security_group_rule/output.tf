output "security_group_rule_id" {
  description = "ID of the security group rule"
  value       = element(concat(aws_security_group_rule.security_group_rule.*.id, [""]), 0)
}
output "security_group_rule_security_group_rule_id" {
  description = "If the aws_security_group_rule resource has a single source or destination then this is the AWS Security Group Rule resource ID. Otherwise it is empty"
  value       = element(concat(aws_security_group_rule.security_group_rule.*.security_group_rule_id, [""]), 0)
}
