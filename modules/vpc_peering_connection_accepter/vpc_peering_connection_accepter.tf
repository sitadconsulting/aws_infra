resource "aws_vpc_peering_connection_accepter" "vpc_peering_connection_accepter" {
  auto_accept               = var.vpc_peering_connection_accepter_auto_accept
  tags                      = var.vpc_peering_connection_accepter_tags
  vpc_peering_connection_id = var.vpc_peering_connection_accepter_vpc_peering_connection_id

  dynamic "accepter" {
    for_each = var.vpc_peering_connection_accepter_accepter
      content {
        allow_remote_vpc_dns_resolution = accepter.value["allow_remote_vpc_dns_resolution"]
      }
  }
  dynamic "requester" {
    for_each = var.vpc_peering_connection_accepter_requester
      content {
        allow_remote_vpc_dns_resolution = requester.value["allow_remote_vpc_dns_resolution"]
      }
  }
}
