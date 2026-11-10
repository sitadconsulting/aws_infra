output "config_organization_custom_policy_rule_arn" {
  description = "ARN of the rule"
  value       = element(concat(aws_config_organization_custom_policy_rule.config_organization_custom_policy_rule.*.arn, [""]), 0)
}
