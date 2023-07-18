resource "aws_lambda_function_url" "lambda_function_url" {
  authorization_type = var.lambda_function_url_authorization_type
  function_name      = var.lambda_function_url_function_name
  invoke_mode        = var.lambda_function_url_invoke_mode
  qualifier          = var.lambda_function_url_qualifier


  dynamic "cors" {
    for_each = var.lambda_function_url_cors
      content {
        allow_credentials = cors.value["allow_credentials"]
        allow_headers     = cors.value["allow_headers"]
        allow_methods     = cors.value["allow_methods"]
        allow_origins     = cors.value["allow_origins"]
        expose_headers    = cors.value["expose_headers"]
        max_age           = cors.value["max_age"]
      }
  }
}
