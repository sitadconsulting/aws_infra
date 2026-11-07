resource "aws_cloudfront_anycast_ip_list" "cloudfront_anycast_ip_list" {
  ip_count = var.cloudfront_anycast_ip_list_ip_count
  name     = var.cloudfront_anycast_ip_list_name
  tags     = var.cloudfront_anycast_ip_list_tags
}
