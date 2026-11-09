resource "aws_cloudfront_public_key" "cloudfront_public_key" {
  comment     = var.cloudfront_public_key_comment
  encoded_key = var.cloudfront_public_key_encoded_key
  name        = var.cloudfront_public_key_name
  name_prefix = var.cloudfront_public_key_name_prefix
}
