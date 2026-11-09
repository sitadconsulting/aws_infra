resource "aws_cloudfront_origin_access_control" "cloudfront_origin_access_control" {
  description                       = var.cloudfront_origin_access_control_description
  name                              = var.cloudfront_origin_access_control_name
  origin_access_control_origin_type = var.cloudfront_origin_access_control_origin_access_control_origin_type
  signing_behavior                  = var.cloudfront_origin_access_control_signing_behavior
  signing_protocol                  = var.cloudfront_origin_access_control_signing_protocol
}
