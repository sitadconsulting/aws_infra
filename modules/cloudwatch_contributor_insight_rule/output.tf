output "cloudwatch_contributor_insight_rule_resource_arn" {
  description = "ARN of the Contributor Insight Rule"
  value       = element(concat(aws_cloudwatch_contributor_insight_rule.cloudwatch_contributor_insight_rule.*.resource_arn, [""]), 0)
}
