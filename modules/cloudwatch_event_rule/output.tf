output "cloudwatch_event_rule_id" {
  description = "The name of the rule"
  value       = element(concat(aws_cloudwatch_event_rule.cloudwatch_event_rule.*.id, [""]), 0)
}
output "cloudwatch_event_rule_arn" {
  description = "The Amazon Resource Name (ARN) of the rule"
  value       = element(concat(aws_cloudwatch_event_rule.cloudwatch_event_rule.*.arn, [""]), 0)
}
