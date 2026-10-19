resource "aws_lb_target_group" "lb_target_group" {
  connection_termination             = var.lb_target_group_connection_termination
  deregistration_delay               = var.lb_target_group_deregistration_delay
  ip_address_type                    = var.lb_target_group_ip_address_type
  lambda_multi_value_headers_enabled = var.lb_target_group_lambda_multi_value_headers_enabled
  load_balancing_algorithm_type      = var.lb_target_group_load_balancing_algorithm_type
  load_balancing_anomaly_mitigation  = var.lb_target_group_load_balancing_anomaly_mitigation
  load_balancing_cross_zone_enabled  = var.lb_target_group_load_balancing_cross_zone_enabled
  name                               = var.lb_target_group_name
  name_prefix                        = var.lb_target_group_name_prefix
  port                               = var.lb_target_group_port
  preserve_client_ip                 = var.lb_target_group_preserve_client_ip
  protocol                           = var.lb_target_group_protocol
  protocol_version                   = var.lb_target_group_protocol_version
  proxy_protocol_v2                  = var.lb_target_group_proxy_protocol_v2
  slow_start                         = var.lb_target_group_slow_start
  tags                               = var.lb_target_group_tags
  target_control_port                = var.lb_target_group_target_control_port
  target_type                        = var.lb_target_group_target_type
  vpc_id                             = var.lb_target_group_vpc_id

  dynamic "health_check" {
    for_each = var.lb_target_group_health_check
      content {
        enabled             = health_check.value["enabled"]
        healthy_threshold   = health_check.value["healthy_threshold"]
        interval            = health_check.value["interval"]
        matcher             = health_check.value["matcher"]
        path                = health_check.value["path"]
        port                = health_check.value["port"]
        protocol            = health_check.value["protocol"]
        timeout             = health_check.value["timeout"]
        unhealthy_threshold = health_check.value["unhealthy_threshold"] 
      }
  }
  dynamic "stickiness" {
    for_each = var.lb_target_group_stickiness
      content {
        cookie_duration = stickiness.value["cookie_duration"]
        cookie_name     = stickiness.value["cookie_name"]
        enabled         = stickiness.value["enabled"]
        type            = stickiness.value["type"]
      }
  }
  dynamic "target_failover" {
    for_each = var.lb_target_group_target_failover
      content {
        on_deregistration = target_failover.value["on_deregistration"]
        on_unhealthy      = target_failover.value["on_unhealthy"]
      }
  }
  dynamic "target_group_health" {
    for_each = var.lb_target_group_target_group_health
      content {
        dynamic "dns_failover" {
          for_each = target_group_health.value.dns_failover
            content {
              minimum_healthy_targets_count      = dns_failover.value["minimum_healthy_targets_count"]
              minimum_healthy_targets_percentage = dns_failover.value["minimum_healthy_targets_percentage"]
            }
        }
        dynamic "unhealthy_state_routing" {
          for_each = target_group_health.value.unhealthy_state_routing
            content {
              minimum_healthy_targets_count       = unhealthy_state_routing.value["minimum_healthy_targets_count"]
              minimum_healthy_targets_percentage  = unhealthy_state_routing.value["minimum_healthy_targets_percentage"]
            }
        }
      }
  }
}

