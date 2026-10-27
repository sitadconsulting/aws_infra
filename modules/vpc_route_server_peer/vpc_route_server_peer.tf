resource "aws_vpc_route_server_peer" "vpc_route_server_peer" {
  peer_address             = var.vpc_route_server_peer_peer_address
  route_server_endpoint_id = var.vpc_route_server_peer_route_server_endpoint_id
  tags                     = var.vpc_route_server_peer_tags

  dynamic "bgp_options" {
    for_each = var.vpc_route_server_peer_bgp_options
      content {
        peer_asn                = bgp_options.value["peer_asn"]
        peer_liveness_detection = bgp_options.value["peer_liveness_detection"]
      }
  }
}
