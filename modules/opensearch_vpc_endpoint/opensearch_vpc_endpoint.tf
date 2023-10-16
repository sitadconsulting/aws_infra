resource "aws_opensearch_vpc_endpoint" "opensearch_vpc_endpoint" {
  domain_arn = var.opensearch_vpc_endpoint_domain_arn

  dynamic "vpc_options" {
    for_each = var.opensearch_vpc_endpoint_vpc_options
      content {
        security_group_ids = vpc_options.value["security_group_ids"]
        subnet_ids         = vpc_options.value["subnet_ids"]
      }
  }
}
