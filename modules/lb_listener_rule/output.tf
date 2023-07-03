output "listener_rule_arn" {
  description = "Rule ARN"
  value       = element(concat(aws_lb_listener_rule.lb_listener_rule.*.arn, [""]), 0)
}

