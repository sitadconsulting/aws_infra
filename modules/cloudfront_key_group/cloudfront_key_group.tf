resource "aws_cloudfront_key_group" "cloudfront_key_group" {
  comment = var.cloudfront_key_group_comment
  items   = var.cloudfront_key_group_items
  name    = var.cloudfront_key_group_name
}
