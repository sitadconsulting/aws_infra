resource "aws_cloudwatch_composite_alarm" "cloudwatch_composite_alarm" {
  actions_enabled           = var.cloudwatch_composite_alarm_actions_enabled
  alarm_actions             = var.cloudwatch_composite_alarm_alarm_actions
  alarm_description         = var.cloudwatch_composite_alarm_alarm_description
  alarm_name                = var.cloudwatch_composite_alarm_alarm_name
  alarm_rule                = var.cloudwatch_composite_alarm_alarm_rule
  insufficient_data_actions = var.cloudwatch_composite_alarm_insufficient_data_actions
  ok_actions                = var.cloudwatch_composite_alarm_ok_actions
  tags                      = var.cloudwatch_composite_alarm_tags

  dynamic "actions_suppressor" {
    for_each = var.cloudwatch_composite_alarm_actions_suppressor
      content {
        alarm            = actions_suppressor.value["alarm"]
        extension_period = actions_suppressor.value["extension_period"]
        wait_period      = actions_suppressor.value["wait_period"]
      }
  }

}
