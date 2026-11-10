resource "aws_cloudfront_vpc_origin" "cloudfront_vpc_origin" {
  tags = var.cloudfront_vpc_origin_tags

  dynamic "vpc_origin_endpoint_config" {
    for_each = var.cloudfront_vpc_origin_vpc_origin_endpoint_config
      content {
        arn                    = vpc_origin_endpoint_config.value["arn"]
        http_port              = vpc_origin_endpoint_config.value["http_port"]
        https_port             = vpc_origin_endpoint_config.value["https_port"]
        name                   = vpc_origin_endpoint_config.value["name"]
        origin_protocol_policy = vpc_origin_endpoint_config.value["origin_protocol_policy"]  
        origin_ssl_protocols   = vpc_origin_endpoint_config.value["origin_ssl_protocols"]
      }
  }
}
