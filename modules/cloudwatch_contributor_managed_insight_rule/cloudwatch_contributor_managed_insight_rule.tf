resource "aws_cloudwatch_contributor_managed_insight_rule" "cloudwatch_contributor_managed_insight_rule" {
  resource_arn  = var.cloudwatch_contributor_managed_insight_rule_resource_arn
  rule_state    = var.cloudwatch_contributor_managed_insight_rule_rule_state
  template_name = var.cloudwatch_contributor_managed_insight_rule_template_name
}
