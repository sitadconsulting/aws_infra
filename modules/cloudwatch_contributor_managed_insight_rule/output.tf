output "cloudwatch_contributor_managed_insight_rule_arn" {
  description = "ARN of the Contributor Managed Insight Rule"
  value       = element(concat(aws_cloudwatch_contributor_managed_insight_rule.cloudwatch_contributor_managed_insight_rule.*.arn, [""]), 0)
}
output "cloudwatch_contributor_managed_insight_rule_rule_name" {
  description = "Name of the Contributor Insights rule that contains data for the specified AWS resource"
  value       = element(concat(aws_cloudwatch_contributor_managed_insight_rule.cloudwatch_contributor_managed_insight_rule.*.rule_name, [""]), 0)
}
