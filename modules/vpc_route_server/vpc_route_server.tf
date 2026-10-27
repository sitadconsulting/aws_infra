resource "aws_vpc_route_server" "vpc_route_server" {
  amazon_side_asn           = var.vpc_route_server_amazon_side_asn
  persist_routes            = var.vpc_route_server_persist_routes
  persist_routes_duration   = var.vpc_route_server_persist_routes_duration
  sns_notifications_enabled = var.vpc_route_server_sns_notifications_enabled
  tags                      = var.vpc_route_server_tags
}
