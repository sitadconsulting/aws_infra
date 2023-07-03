resource "aws_db_proxy_endpoint" "db_proxy_endpoint" {
  db_proxy_endpoint_name = var.db_proxy_endpoint_db_proxy_endpoint_name
  db_proxy_name          = var.db_proxy_endpoint_db_proxy_name
  vpc_subnet_ids         = var.db_proxy_endpoint_vpc_subnet_ids
  vpc_security_group_ids = var.db_proxy_endpoint_vpc_security_group_ids
  target_role            = var.db_proxy_endpoint_target_role
  tags                   = var.db_proxy_endpoint_tags
}
