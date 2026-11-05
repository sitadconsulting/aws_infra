resource "aws_appintegrations_event_integration" "appintegrations_event_integration" {
  description     = var.appintegrations_event_integration_description
  eventbridge_bus = var.appintegrations_event_integration_eventbridge_bus
  name            = var.appintegrations_event_integration_name
  tags            = var.appintegrations_event_integration_tags


  dynamic "event_filter" {
    for_each = var.appintegrations_event_integration_event_filter
      content {
        source = event_filter.value["source"]
      }
  }
}
