resource "aws_lambda_alias" "lambda_alias" {
  description      = var.lambda_alias_description
  function_name    = var.lambda_alias_function_name
  function_version = var.lambda_alias_function_version
  name             = var.lambda_alias_name

  dynamic "routing_config" {
    for_each = var.lambda_alias_routing_config
      content {
        additional_version_weights = routing_config.value["additional_version_weights"]
      }
  }
}
