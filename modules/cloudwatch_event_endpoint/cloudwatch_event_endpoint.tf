resource "aws_cloudwatch_event_endpoint" "cloudwatch_event_endpoint" {
  description = var.cloudwatch_event_endpoint_description
  name        = var.cloudwatch_event_endpoint_name
  role_arn    = var.cloudwatch_event_endpoint_role_arn

  dynamic "event_bus" {
    for_each = var.cloudwatch_event_endpoint_event_bus
      content {
        event_bus_arn = event_bus.value["event_bus_arn"]
      }
  }
  dynamic "replication_config" {
    for_each = var.cloudwatch_event_endpoint_replication_config
      content {
        state = replication_config.value["state"]
      }
  }
  dynamic "routing_config" {
    for_each = var.cloudwatch_event_endpoint_routing_config
      content {
        dynamic "failover_config" {
          for_each = routing_config.value.failover_config
            content {
              dynamic "primary" {
                for_each = failover_config.value.primary
                  content {
                    health_check = primary.value["health_check"]
                  }
              }
              dynamic "secondary" {
                for_each = failover_config.value.secondary
                  content {
                    route = secondary.value["route"]
                  }
              }
            }
        }
      }
  }
}
