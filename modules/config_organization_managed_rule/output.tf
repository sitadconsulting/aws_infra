output "config_organization_managed_rule_arn" {
  description = "ARN of the rule"
  value       = element(concat(aws_config_organization_managed_rule.config_organization_managed_rule.*.arn, [""]), 0)
}
