resource "aws_apigatewayv2_routing_rule" "apigatewayv2_routing_rule" {
  domain_name = var.apigatewayv2_routing_rule_domain_name
  priority    = var.apigatewayv2_routing_rule_priority

  dynamic "action" {
    for_each = var.apigatewayv2_routing_rule_action
      content {
       dynamic "invoke_api" {
         for_each = action.value.invoke_api
           content {
             api_id          = invoke_api.value["api_id"]
             stage           = invoke_api.value["stage"]
             strip_base_path = invoke_api.value["strip_base_path"]   
           }
       } 
      }
  }
  dynamic "condition" {
    for_each = var.apigatewayv2_routing_rule_condition
      content {
        dynamic "match_base_paths" {
          for_each = condition.value.match_base_paths
            content {
              dynamic "any_of" {
                for_each = match_base_paths.value.any_of
                  content {
                    header     = any_of.value["header"]
                    value_glob = any_of.value["value_glob"]
                  }
              }
            }
        } 
        dynamic "match_headers" {
          for_each = condition.value.match_headers
            content {
              dynamic "any_of" {
                for_each = match_headers.value.any_of
                  content {
                    header     = any_of.value["header"]
                    value_glob = any_of.value["value_glob"]
                  }
              }
            }
        }    
      }
  }
}
