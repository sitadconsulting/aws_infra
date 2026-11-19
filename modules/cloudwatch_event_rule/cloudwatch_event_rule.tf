resource "aws_cloudwatch_event_rule" "cloudwatch_event_rule" {
  description          = var.cloudwatch_event_rule_description
  event_bus_name       = var.cloudwatch_event_rule_event_bus_name
  event_pattern        = var.cloudwatch_event_rule_event_pattern
  force_destroy        = var.cloudwatch_event_rule_force_destroy
  is_enabled           = var.cloudwatch_event_rule_is_enabled
  name                 = var.cloudwatch_event_rule_name
  name_prefix          = var.cloudwatch_event_rule_name_prefix
  role_arn             = var.cloudwatch_event_rule_role_arn
  schedule_expression  = var.cloudwatch_event_rule_schedule_expression
  state                = var.cloudwatch_event_rule_state
  tags                 = var.cloudwatch_event_rule_tags   
}

