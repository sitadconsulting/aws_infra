output "lb_listener_rule_id" {
  description = "The ARN of the rule (matches arn)"
  value       = element(concat(aws_lb_listener_rule.lb_listener_rule.*.id, [""]), 0)
}
output "lb_listener_rule_arn" {
  description = "The ARN of the rule (matches id)"
  value       = element(concat(aws_lb_listener_rule.lb_listener_rule.*.arn, [""]), 0)
}
