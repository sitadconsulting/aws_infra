resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.lb_listener_load_balancer_arn
  alpn_policy       = var.lb_listener_alpn_policy
  certificate_arn   = var.lb_listener_certificate_arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  ssl_policy        = var.lb_listener_ssl_policy
  tags              = var.lb_listener_tags

  dynamic "default_action" {
    for_each = var.lb_listener_default_action
      content {
        type             = default_action.value["type"]
        order            = default_action.value["order"]
        target_group_arn = default_action.value["target_group_arn"]
   
        dynamic "authenticate_cognito" {
          for_each = default_action.value.authenticate_cognito
            content {
              user_pool_arn              = authenticate_cognito.value["user_pool_arn"]
              user_pool_client_id        = authenticate_cognito.value["user_pool_client_id"]
              user_pool_domain           = authenticate_cognito.value["user_pool_domain"]
              on_unauthenticated_request = authenticate_cognito.value["on_unauthenticated_request"]
              scope                      = authenticate_cognito.value["scope"] 
              session_cookie_name        = authenticate_cognito,value["session_cookie_name"]
              session_time               = authenticate_cognito,value["session_timeout"]
              dynamic "authentication_request_extra_params" {
                for_each = authenticate_cognito.value.authentication_request_extra_params
                  content {
                    key   = authentication_request_extra_params.value["key"]
                    value = authentication_request_extra_params.value["value"]
                  }
              }
            }
        }
        dynamic "authenticate_oidc" {
          for_each = default_action.value.authenticate_oidc
            content {
              authorization_endpoint     = authenticate_oidc.value["authorization_endpoint"]
              client_id                  = authenticate_oidc.value["client_id"]
              client_secret              = authenticate_oidc.value["client_secret"]
              issuer                     = authenticate_oidc.value["issuer"]
              token_endpoint             = authenticate_oidc.value["token_endpoint"]
              user_info_endpoint         = authenticate_oidc.value["user_info_endpoint"]
              on_unauthenticated_request = authenticate_oidc.value["on_unauthenticated_request"]
              scope                      = authenticate_oidc.value["scpoe"]
              session_cookie_name        = authenticate_oidc.value["session_cookie_name"] 
              session_time               = authenticate_oidc.value["session_time"]
              dynamic "authentication_request_extra_params" {
                for_each = authenticate_oidc.value.authentication_request_extra_params
                  content {
                    key   = authentication_request_extra_params.value["key"]
                    value = authentication_request_extra_params.value["value"]
                  }
              }
              
            }
        }
        dynamic "fixed_response" {
          for_each = default_action.value.fixed_response
            content {
              content_type = fixed_response.value["content_type"]
              message_body = fixed_response.value["message_body"]
              status_code  = fixed_response.value["status_code"]
            }
        }
        dynamic "forward" {
          for_each = default_action.value.forward
            content {
              dynamic "target_group" {
                for_each = forward.value.target_group
                  content {
                    arn    = target_group.value["arn"]
                    weight = target_group.value["weight"]
                  }
              }
              dynamic "stickiness" {
                for_each = forward.value.stickiness
                  content {
                    duration = stickiness.value["duration"]
                    enabled  = stickiness.value["enabled"]
                  }
              }
            }
        }
        dynamic "redirect" {
          for_each = default_action.value.redirect
            content {
              status_code = redirect.value["status_code"]
              host        = redirect.value["host"]
              path        = redirect.value["path"]
              port        = redirect.value["port"]
              protocol    = redirect.value["protocol"]
              query       = redirect.value["query"]
            }
        }
      }
  }
}
