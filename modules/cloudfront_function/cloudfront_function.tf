resource "aws_cloudfront_function" "cloudfront_function" {
  code                         = var.cloudfront_function_code
  comment                      = var.cloudfront_function_comment
  key_value_store_associations = var.cloudfront_function_key_value_store_associations
  name                         = var.cloudfront_function_name
  publish                      = var.cloudfront_function_publish
  runtime                      = var.cloudfront_function_runtime
  tags                         = var.cloudfront_function_tags
}
