resource "aws_cloudwatch_event_connection" "cloudwatch_event_connection" {
  authorization_type = var.cloudwatch_event_connection_authorization_type
  description        = var.cloudwatch_event_connection_description
  kms_key_identifier = var.cloudwatch_event_connection_kms_key_identifier
  name               = var.cloudwatch_event_connection_name

  dynamic "auth_parameters" {
    for_each = var.cloudwatch_event_connection_auth_parameters
      content {
        dynamic "api_key" {
          for_each = auth_parameters.value.api_key
            content {
              key   = api_key.value["key"]
              value = api_key.value["value"]
            }
        }
        dynamic "basic" {
          for_each = auth_parameters.value.basic
            content {
              password = basic.value["password"]
              username = basic.value["username"]
            }
        }        
        dynamic "connectivity_parameters" {
          for_each = auth_parameters.value.connectivity_parameters
            content {
              dynamic "resource_parameters" {
                for_each = connectivity_parameters.value.resource_parameters
                  content {
                    resource_configuration_arn = resource_parameters.value["resource_configuration_arn"]
                  }
              } 
            }
        }
        dynamic "invocation_http_parameters" {
          for_each = auth_parameters.value.invocation_http_parameters
            content {
              dynamic "body" {
                for_each = invocation_http_parameters.value.body
                  content {
                    is_value_secret = body.value["is_value_secret"]
                    key             = body.value["key"]
                    value           = body.value["value"]
                  }
              }
              dynamic "header" {
                for_each = invocation_http_parameters.value.header
                  content {
                    is_value_secret = header.value["is_value_secret"]
                    key             = header.value["key"]
                    value           = header.value["value"]
                  }
              }
              dynamic "query_string" {
                for_each = invocation_http_parameters.value.query_string
                  content {
                    is_value_secret = query_string.value["is_value_secret"]
                    key             = query_string.value["key"]
                    value           = query_string.value["value"]
                  }
              }
            }
        }
        dynamic "oauth" {
          for_each = auth_parameters.value.oauth
            content {
              authorization_endpoint = oauth.value["authorization_endpoint"]
              http_method            = oauth.value["http_method"]
              dynamic "client_parameters" {
                for_each = oauth.value.client_parameters
                  content {
                    client_id     = client_parameters.value["client_id"]
                    client_secret = client_parameters.value["client_secret"]
                  }
              }
              dynamic "oauth_http_parameters" {
                for_each = oauth.value.oauth_http_parameters
                  content {
                    dynamic "body" {
                      for_each = oauth_http_parameters.value.body
                        content {
                          is_value_secret = body.value["is_value_secret"]
                          key             = body.value["key"]
                          value           = body.value["value"]
                        } 
                    }
                    dynamic "header" {
                      for_each = oauth_http_parameters.value.header
                        content {
                          is_value_secret = header.value["is_value_secret"]
                          key             = header.value["key"]
                          value           = header.value["value"]
                        }
                    }
                    dynamic "query_string" {
                      for_each = oauth_http_parameters.value.query_string
                        content {
                          is_value_secret = query_string.value["is_value_secret"]
                          key             = query_string.value["key"]
                          value           = query_string.value["value"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "invocation_connectivity_parameters" {
    for_each = var.cloudwatch_event_connection_invocation_connectivity_parameters
      content {
        dynamic "resource_parameters" {
          for_each = invocation_connectivity_parameters.value.resource_parameters
            content {
              resource_configuration_arn = resource_parameters.value["resource_configuration_arn"]
            }
        } 
      }
  }
}
