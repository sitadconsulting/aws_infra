resource "aws_quicksight_vpc_connection" "quicksight_vpc_connection" {
  aws_account_id     = var.quicksight_vpc_connection_aws_account_id
  vpc_connection_id  = var.quicksight_vpc_connection_vpc_connection_id
  name               = var.quicksight_vpc_connection_name
  role_arn           = var.quicksight_vpc_connection_role_arn
  security_group_ids = var.quicksight_vpc_connection_security_group_ids
  subnet_ids         = var.quicksight_vpc_connection_subnet_ids
  dns_resolvers      = var.quicksight_vpc_connection_dns_resolvers
  tags               = var.quicksight_vpc_connection_tags
}
