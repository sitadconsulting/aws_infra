resource "aws_cloudwatch_alarm_mute_rule" "cloudwatch_alarm_mute_rule" {
  description = var.cloudwatch_alarm_mute_rule_description
  expire_date = var.cloudwatch_alarm_mute_rule_expire_date
  name        = var.cloudwatch_alarm_mute_rule_name
  start_date  = var.cloudwatch_alarm_mute_rule_start_date
  tags        = var.cloudwatch_alarm_mute_rule_tags

  dynamic "rule" {
    for_each = var.cloudwatch_alarm_mute_rule_rule
      content {
        dynamic "schedule" {
          for_each = rule.value.schedule
            content {
              duration   = schedule.value["duration"]
              expression = schedule.value["expression"]
              timezone   = schedule.value["timezone"]
            }
        }
      }
  }
  dynamic "mute_targets" {
    for_each = var.cloudwatch_alarm_mute_rule_mute_targets
      content {
        alarm_names = mute_targets.value["alarm_names"]
      }
  }
}
