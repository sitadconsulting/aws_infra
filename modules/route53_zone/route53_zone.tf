resource "aws_route53_zone" "route53_zone" {
  name              = var.route53_zone_name
  comment           = var.route53_zone_comment
  delegation_set_id = var.route53_zone_delegation_set_id
  force_destroy     = var.route53_zone_force_destroy
  tags              = var.route53_tags

  dynamic "vpc" {
    for_each = var.route53_zone_vpc
      content {
        vpc_id     = vpc.value["vpc_id"]
        vpc_region = vpc.value["vpc_region"]
      }
  }
}
