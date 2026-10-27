resource "aws_vpc_peering_connection_options" "vpc_peering_connection_options" {
  vpc_peering_connection_id = var.vpc_peering_connection_options_vpc_peering_connection_id

  dynamic "accepter" {
    for_each = var.vpc_peering_connection_options_accepter
      content {
        allow_remote_vpc_dns_resolution = accepter.value["allow_remote_vpc_dns_resolution"]
      }
  }
  dynamic "requester" {
    for_each = var.vpc_peering_connection_options_requester
      content {
        allow_remote_vpc_dns_resolution = requester.value["allow_remote_vpc_dns_resolution"]
      }
  }
}
