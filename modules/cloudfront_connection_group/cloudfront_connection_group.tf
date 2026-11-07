resource "aws_cloudfront_connection_group" "cloudfront_connection_group" {
  anycast_ip_list_id = var.cloudfront_connection_group_anycast_ip_list_id
  enabled            = var.cloudfront_connection_group_enabled
  ipv6_enabled       = var.cloudfront_connection_group_ipv6_enabled
  name               = var.cloudfront_connection_group_name
  tags               = var.cloudfront_connection_group_tags
}
