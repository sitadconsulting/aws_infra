resource "aws_appsync_channel_namespace" "appsync_channel_namespace" {
  api_id        = var.appsync_channel_namespace_api_id
  code_handlers = var.appsync_channel_namespace_code_handlers
  name          = var.appsync_channel_namespace_name 
  tags          = var.appsync_channel_namespace_tags

  dynamic "handler_configs" {
    for_each = var.appsync_channel_namespace_handler_configs
      content {
        dynamic "on_publish" {
          for_each = handler_configs.value.on_publish
            content {
              behavior = on_publish.value["behavior"]
              dynamic "integration" {
                for_each = on_publish.value.integration
                  content {
                    data_source_name = integration.value["data_source_name"]
                    dynamic "lambda_config" {
                      for_each = integration.value.lambda_config
                        content {
                          invoke_type = lambda_config.value["invoke_type"]
                        }
                    }
                  }
              }
            }
        }
        dynamic "on_subscribe" {
          for_each = handler_configs.value.on_subscribe
            content {
              behavior = on_subscribe.value["behavior"]
              dynamic "integration" {
                for_each = on_subscribe.value.integration
                  content {
                    data_source_name = integration.value["data_source_name"]
                    dynamic "lambda_config" {
                      for_each = integration.value.lambda_config
                        content {
                          invoke_type = lambda_config.value["invoke_type"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "publish_auth_mode" {
    for_each = var.appsync_channel_namespace_publish_auth_mode
      content {
        auth_type = publish_auth_mode.value["auth_type"]
      }
  }
  dynamic "subscribe_auth_mode" {
    for_each = var.appsync_channel_namespace_subscribe_auth_mode
      content {
        auth_type = subscribe_auth_mode.value["auth_type"]
      }
  }
}
