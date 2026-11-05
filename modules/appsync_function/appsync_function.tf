resource "aws_appsync_function" "appsync_function" {
  api_id                    = var.appsync_function_api_id
  code                      = var.appsync_function_code
  data_source               = var.appsync_function_data_source
  description               = var.appsync_function_description
  function_version          = var.appsync_function_function_version
  max_batch_size            = var.appsync_function_max_batch_size
  name                      = var.appsync_function_name
  request_mapping_template  = var.appsync_function_request_mapping_template
  response_mapping_template = var.appsync_function_response_mapping_template


  dynamic "runtime" {
    for_each = var.appsync_function_runtime
      content {
        name            = runtime.value["name"]
        runtime_version = runtime.value["runtime_version"]
      }
  }
  dynamic "sync_config" {
    for_each = var.appsync_function_sync_config
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
