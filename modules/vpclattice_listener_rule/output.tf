output "vpclattice_listener_rule_arn" {
  description = "ARN of the listener rule"
  value       = element(concat(aws_vpclattice_listener_rule.vpclattice_listener_rule.*.arn, [""]), 0)
}
output "vpclattice_listener_rule_id" {
  description = "Unique identifier of the listener rule"
  value       = element(concat(aws_vpclattice_listener_rule.vpclattice_listener_rule.*.rule_id, [""]), 0)
}
