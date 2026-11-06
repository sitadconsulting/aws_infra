resource "aws_appsync_resolver" "appsync_resolver" {
  api_id            = var.appsync_resolver_api_id
  code              = var.appsync_resolver_code
  data_source       = var.appsync_resolver_data_source
  field             = var.appsync_resolver_field
  kind              = var.appsync_resolver_kind
  max_batch_size    = var.appsync_resolver_max_batch_size 
  request_template  = var.appsync_resolver_request_template
  response_template = var.appsync_resolver_response_template
  type              = var.appsync_resolver_type
  


  dynamic "caching_config" {
    for_each = var.appsync_resolver_caching_config
      content {
        caching_keys = caching_config.value["caching_keys"]
        ttl          = caching_config.value["ttl"]
      }
  }
  dynamic "pipeline_config" {
    for_each = var.appsync_resolver_pipeline_config
      content {
        functions = pipeline_config.value["functions"]
      }
  }
  dynamic "runtime" {
    for_each = var.appsync_resolver_runtime
      content {
        name            = runtime.value["name"]
        runtime_version = runtime.value["runtime_version"]
      }
  }
  dynamic "sync_config" {
    for_each = var.appsync_resolver_sync_config
      content {
        conflict_detection = sync_config.value["conflict_detection"]
        conflict_handler   = sync_config.value["conflict_handler"]
        dynamic "lambda_conflict_handler_config" {
          for_each = sync_config.value.lambda_conflict_handler_config
            content {
              lambda_conflict_handler_arn = lambda_conflict_handler_config.value["lambda_conflict_handler_arn"]
            }
        }
      }
  }
}
