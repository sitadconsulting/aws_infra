resource "aws_vpclattice_listener_rule" "vpclattice_listener_rule" {
  name                = var.vpclattice_listener_rule_name
  listener_identifier = var.vpclattice_listener_rule_listener_identifier
  service_identifier  = var.vpclattice_listener_rule_service_identifier
  priority            = var.vpclattice_listener_rule_priority
  tags                = var.vpclattice_listener_rule_tags

  dynamic "action" {
    for_each = var.vpclattice_listener_rule_action
      content {
        dynamic "forward" {
          for_each = action.value.forward
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
        dynamic "fixed_response" {
          for_each = action.value.fixed_response
            content {
              status_code = fixed_response.value["status_code"]
            }
        }
      } 
  }
  dynamic "match" {
    for_each = var.vpclattice_listener_rule_match
      content {
        dynamic "http_match" {
          for_each = match.value.http_match
            content {
              method  = http_match.value["method"]
              dynamic "header_matches" {
                for_each = http_match.value.header_matches
                  content {
                    case_sensitive = header_matches.value["case_sensitive"]
                    name           =  header_matches.value["name"]
                    dynamic "match" {
                      for_each = header_matches.value.match
                        content {
                          contains = match.value["contains"]
                          exact    = match.value["exact"]
                          prefix   = match.value["prefix"]
                        }
                    }
                  }
              }
              dynamic "path_match" {
                for_each = http_match.value.path_match
                  content {
                    case_sensitive = path_match.value["case_sensitive"]
                    dynamic "match" {
                      for_each = path_match.value.match
                        content {
                          exact  = match.value["exact"]
                          prefix = magtch.value["prefix"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
}
