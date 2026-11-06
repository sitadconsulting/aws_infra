resource "aws_appsync_graphql_api" "appsync_graphql_api" {
  api_type                      = var.appsync_graphql_api_api_type
  authentication_type           = var.appsync_graphql_api_authentication_type
  introspection_config          = var.appsync_graphql_api_introspection_config
  merged_api_execution_role_arn = var.appsync_graphql_api_merged_api_execution_role_arn
  name                          = var.appsync_graphql_api_name
  query_depth_limit             = var.appsync_graphql_api_query_depth_limit
  resolver_count_limit          = var.appsync_graphql_api_resolver_count_limit
  schema                        = var.appsync_graphql_api_schema
  tags                          = var.appsync_graphql_api_tags
  visibility                    = var.appsync_graphql_api_visibility
  xray_enabled                  = var.appsync_graphql_api_xray_enabled


  dynamic "additional_authentication_provider" {
    for_each = var.appsync_graphql_api_additional_authentication_provider
      content {
        authentication_type = additional_authentication_provider.value["authentication_type"]
        dynamic "lambda_authorizer_config" {
          for_each = additional_authentication_provider.value.lambda_authorizer_config
            content {
              authorizer_result_ttl_in_seconds = lambda_authorizer_config.value["authorizer_result_ttl_in_seconds"]
              authorizer_uri                   = lambda_authorizer_config.value["authorizer_uri"]
              identity_validation_expression   = lambda_authorizer_config.value["identity_validation_expression"]
            }
        }
        dynamic "openid_connect_config" {
          for_each = additional_authentication_provider.value.openid_connect_config
            content {
              auth_ttl  = openid_connect_config.value["auth_ttl"]
              client_id = openid_connect_config.value["client_id"]
              iat_ttl   = openid_connect_config.value["iat_ttl"]
              issuer    = openid_connect_config.value["issuer"]
            }
        }
        dynamic "user_pool_config" {
          for_each = additional_authentication_provider.value.user_pool_config
            content {
              app_id_client_regex = user_pool_config.value["app_id_client_regex"]
              aws_region          = user_pool_config.value["aws_region"]
              user_pool_id        = user_pool_config.value["user_pool_id"]
            }
        }
      }
  }
  dynamic "enhanced_metrics_config" {
    for_each = var.appsync_graphql_api_enhanced_metrics_config
      content {
        data_source_level_metrics_behavior = enhanced_metrics_config.value["data_source_level_metrics_behavior"]
        operation_level_metrics_config     = enhanced_metrics_config.value["operation_level_metrics_config"]
        resolver_level_metrics_behavior    = enhanced_metrics_config.value["resolver_level_metrics_behavior"]
      }
  }
  dynamic "lambda_authorizer_config" {
    for_each = var.appsync_graphql_api_lambda_authorizer_config
      content {
        authorizer_result_ttl_in_seconds = lambda_authorizer_config.value["authorizer_result_ttl_in_seconds"]
        authorizer_uri                   = lambda_authorizer_config.value["authorizer_uri"]
        identity_validation_expression   = lambda_authorizer_config.value["identity_validation_expression"]
      }
  }
  dynamic "log_config" {
    for_each = var.appsync_graphql_api_log_config
      content {
        cloudwatch_logs_role_arn = log_config.value["cloudwatch_logs_role_arn"]
        exclude_verbose_content  = log_config.value["exclude_verbose_content"]
        field_log_level          = log_config.value["field_log_level"]
      }
  }
  dynamic "openid_connect_config" {
    for_each = var.appsync_graphql_api_openid_connect_config
      content {
        auth_ttl  = openid_connect_config.value["auth_ttl"]
        client_id = openid_connect_config.value["client_id"]
        iat_ttl   = openid_connect_config.value["iat_ttl"]
        issuer    = openid_connect_config.value["issuer"]
      }
  }
  dynamic "user_pool_config" {
    for_each = var.appsync_graphql_api_user_pool_config
      content {
        app_id_client_regex = user_pool_config.value["app_id_client_regex"]
        aws_region          = user_pool_config.value["aws_region"]
        default_action      = user_pool_config.value["default_action"]
        user_pool_id        = user_pool_config.value["user_pool_id"]
      }
  }
}
