resource "aws_lambda_function_event_invoke_config" "lambda_function_event_invoke_config" {
  function_name                = var.lambda_function_event_invoke_config_function_name
  maximum_event_age_in_seconds = var.lambda_function_event_invoke_config_maximum_event_age_in_seconds
  maximum_retry_attempts       = var.lambda_function_event_invoke_config_maximum_retry_attempts
  qualifier                    = var.lambda_function_event_invoke_config_qualifier

  dynamic "destination_config" {
    for_each = var.lambda_function_event_invoke_config_destination_config
      content {
        dynamic "on_failure" {
          for_each = destination_config.value.on_failure
            content {
              destination = on_failure.value["destination"]
            }
        }
        dynamic "on_success" {
          for_each = destination_config.value.on_success
            content {
              destination = on_success.value["destination"]
            }
        }
      }
  }
}
