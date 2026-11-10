output "config_config_rule_arn" {
  description = "The ARN of the config rule"
  value       = element(concat(aws_config_config_rule.config_config_rule.*.arn, [""]), 0)
}
output "config_config_rule_rule_id" {
  description = "The ID of the config rule"
  value       = element(concat(aws_config_config_rule.config_config_rule.*.rule_id, [""]), 0)
}
