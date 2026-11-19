resource "aws_cloudwatch_event_bus_policy" "cloudwatch_event_bus_policy" {
  policy         = var.cloudwatch_event_bus_policy_policy
  event_bus_name = var.cloudwatch_event_bus_policy_event_bus_name
}
