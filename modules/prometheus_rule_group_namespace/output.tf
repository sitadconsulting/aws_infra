output "prometheus_rule_group_namespace_arn" {
  description = "The ARN of the rule group namespace"
  value       = element(concat(aws_prometheus_rule_group_namespace.prometheus_rule_group_namespace.*.arn, [""]), 0)
}
