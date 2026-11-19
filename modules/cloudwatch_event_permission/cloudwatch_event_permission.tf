resource "aws_cloudwatch_event_permission" "cloudwatch_event_permission" {
  action         = var.cloudwatch_event_permission_action
  event_bus_name = var.cloudwatch_event_permission_event_bus_name
  principal      = var.cloudwatch_event_permission_principal
  statement_id   = var.cloudwatch_event_permission_statement_id

  dynamic "condition" {
    for_each = var.cloudwatch_event_permission_condition
      content {
        key   = condition.value["key"]
        type  = condition.value["type"]
        value = condition.value["value"]
      }
  }
}
