resource "aws_cloudfront_key_value_store" "cloudfront_key_value_store" {
  comment = var.cloudfront_key_value_store_comment
  name    = var.cloudfront_key_value_store_name
}
