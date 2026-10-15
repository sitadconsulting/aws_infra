resource "aws_msk_vpc_connection" "msk_vpc_connection" {
  authentication     = var.msk_vpc_connection_authentication
  client_subnets     = var.msk_vpc_connection_client_subnets
  security_groups    = var.msk_vpc_connection_security_groups
  tags               = var.msk_vpc_connection_tags
  target_cluster_arn = var.msk_vpc_connection_target_cluster_arn
  vpc_id             = var.msk_vpc_connection_vpc_id
}
