resource "aws_appsync_datasource" "appsync_datasource" {
  api_id           = var.appsync_datasource_api_id
  description      = var.appsync_datasource_description
  name             = var.appsync_datasource_name  
  service_role_arn = var.appsync_datasource_service_role_arn
  type             = var.appsync_datasource_type

  dynamic "dynamodb_config" {
    for_each = var.appsync_datasource_dynamodb_config
      content {
        region                 = dynamodb_config.value["region"]
        table_name             = dynamodb_config.value["table_name"]
        use_caller_credentials = dynamodb_config.value["use_caller_credentials"]
        versioned              = dynamodb_config.value["versioned"] 
        dynamic "delta_sync_config" {
          for_each = dynamodb_config.value.delta_sync_config
            content {
              base_table_ttl        = delta_sync_config.value["base_table_ttl"]
              delta_sync_table_name = delta_sync_config.value["delta_sync_table_name"]
              delta_sync_table_ttl  = delta_sync_config.value["delta_sync_table_ttl"] 
            }
        }
      }
  }
  dynamic "elasticsearch_config" {
    for_each = var.appsync_datasource_elasticsearch_config
      content {
        endpoint = elasticsearch_config.value["endpoint"]
        region   = elasticsearch_config.value["region"]
      }
  }
  dynamic "event_bridge_config" {
    for_each = var.appsync_datasource_event_bridge_config
      content {
        event_bus_arn = event_bridge_config.value["event_bus_arn"]
      }
  }
  dynamic "http_config" {
    for_each = var.appsync_datasource_http_config
      content {
        endpoint = http_config.value["endpoint"]
        dynamic "authorization_config" {
          for_each = http_config.value.authorization_config
            content {
              authorization_type = authorization_config.value["authorization_type"]
              dynamic "aws_iam_config" {
                for_each = authorization_config.value.aws_iam_config
                  content {
                    signing_region       = aws_iam_config.value["signing_region"]
                    signing_service_name = aws_iam_config.value["signing_service_name"]
                  }
              }
            }
        }
      }
  }
  dynamic "lambda_config" {
    for_each = var.appsync_datasource_lambda_config
      content {
        function_arn = lambda_config.value["function_arn"]
      }
  }
  dynamic "opensearchservice_config" {
    for_each = var.appsync_datasource_opensearchservice_config
      content {
        endpoint = opensearchservice_config.value["endpoint"]
        region   = opensearchservice_config.value["region"]
      }
  }
  dynamic "relational_database_config" {
    for_each = var.appsync_datasource_relational_database_config
      content {
        source_type = relational_database_config.value["source_type"]
        dynamic "http_endpoint_config" {
          for_each = relational_database_config.value.http_endpoint_config
            content {
              aws_secret_store_arn  = http_endpoint_config.value["aws_secret_store_arn"]
              database_name         = http_endpoint_config.value["database_name"]
              db_cluster_identifier = http_endpoint_config.value["db_cluster_identifier"]
              region                = http_endpoint_config.value["region"]
              schema                = http_endpoint_config.value["schema"]
            }
        }
      }
  }
}
