resource "aws_vpclattice_target_group" "vpclattice_target_group" {
  name   = var.vpclattice_target_group_name
  type   = var.vpclattice_target_group_type
  tags   = var.vpclattice_target_group_tags

  dynamic "config" {
    for_each = var.vpclattice_target_group_config
      content {
        ip_address_type  = config.value["ip_address_type"]
        port             = config.value["port"]
        protocol         = config.value["protocol"]
        protocol_version = config.value["protocol_version"]
        vpc_identifier   = config.value["vpc_identifier"] 
        dynamic "health_check" {
          for_each = config.value.health_check
            content {
              enabled                       = health_check.value["enabled"]
              health_check_interval_seconds = health_check.value["health_check_interval_seconds"]
              health_check_timeout_seconds  = health_check.value["health_check_timeout_seconds"]
              healthy_threshold_count       = health_check.value["healthy_threshold_count"]
              path                          = health_check.value["path"]
              port                          = health_check.value["port"]
              protocol                      = health_check.value["protocol"]
              protocol_version              = health_check.value["protocol_version"]
              unhealthy_threshold_count     = health_check.value["unhealthy_threshold_count"]
              dynamic "matcher" {
                for_each = health_check.value.matcher
                  content {
                    value = matcher.value["value"]
                  }
              }
            }
        }
      }
  }
}
