resource "aws_vpclattice_listener" "vpclattice_listener" {
  name               = var.vpclattice_listener_name
  port               = var.vpclattice_listener_port
  protocol           = var.vpclattice_listener_protocol
  service_arn        = var.vpclattice_listener_service_arn
  service_identifier = var.vpclattice_listener_service_identifier
  tags               = var.vpclattice_listener_tags

  dynamic "default_action" {
    for_each = var.vpclattice_listener_default_action
      content {
        dynamic "fixed_response" {
          for_each = default_action.value.fixed_response
            content {
              status_code = fixed_response.value["status_code"]
            }
        }   
        dynamic "forward" {
          for_each = default_action.value.forward
            content {
              dynamic "target_groups" {
                for_each = forward.value.target_groups
                  content {
                    target_group_identifier = target_groups.value["target_group_identifier"] 
                    weight                  = target_groups.value["weight"]
                  }
              }
            }
        }
      }
  }
}
