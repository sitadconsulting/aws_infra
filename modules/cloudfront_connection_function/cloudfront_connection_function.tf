resource "aws_cloudfront_connection_function" "cloudfront_connection_function" {
  connection_function_code = var.cloudfront_connection_function_connection_function_code
  name                     = var.cloudfront_connection_function_name
  publish                  = var.cloudfront_connection_function_publish
  tags                     = var.cloudfront_connection_function_tags

  dynamic "connection_function_config" {
    for_each = var.cloudfront_connection_function_connection_function_config
      content {
        comment = connection_function_config.value["comment"]
        runtime = connection_function_config.value["runtime"]
        dynamic "key_value_store_association" {
          for_each = connection_function_config.value.key_value_store_association
            content {
              key_value_store_arn = key_value_store_association.value["key_value_store_arn"]
            }
        }
      }
  }
}
