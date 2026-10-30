resource "aws_cloudwatch_contributor_insight_rule" "cloudwatch_contributor_insight_rule" {
  rule_definition = var.cloudwatch_contributor_insight_rule_rule_definition
  rule_name       = var.cloudwatch_contributor_insight_rule_rule_name
  rule_state      = var.cloudwatch_contributor_insight_rule_rule_state
}
