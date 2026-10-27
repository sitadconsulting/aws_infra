resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  auto_accept   = var.vpc_peering_connection_auto_accept
  peer_owner_id = var.vpc_peering_connection_peer_owner_id
  peer_region   = var.vpc_peering_connection_peer_region
  peer_vpc_id   = var.vpc_peering_connection_peer_vpc_id
  tags          = var.vpc_peering_connection_tags
  vpc_id        = var.vpc_peering_connection_vpc_id

  dynamic "accepter" {
    for_each = var.vpc_peering_connection_accepter
      content {
        allow_remote_vpc_dns_resolution = accepter.value["allow_remote_vpc_dns_resolution"]
      }
  }
  dynamic "requester" {
    for_each = var.vpc_peering_connection_requester
      content {
        allow_remote_vpc_dns_resolution = requester.value["allow_remote_vpc_dns_resolution"]
      }
  }
}
