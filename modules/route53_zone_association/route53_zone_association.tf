resource "aws_route53_zone_association" "route53_zone_association" {
  zone_id    = var.route53_zone_association_zone_id
  vpc_id     = var.route53_zone_association_vpc_id
  vpc_region = var.route53_zone_association_vpc_region 
}
