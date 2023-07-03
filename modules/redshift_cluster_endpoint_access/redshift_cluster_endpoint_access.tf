resource "aws_redshift_endpoint_access" "redshift_endpoint_access" {
  cluster_identifier     = var.redshift_endpoint_access_cluster_identifier
  endpoint_name          = var.redshift_endpoint_access_endpoint_name
  resource_owner         = var.redshift_endpoint_access_resource_owner
  subnet_group_name      = var.redshift_endpoint_access_subnet_group_name
  vpc_security_group_ids = var.redshift_endpoint_access_vpc_security_group_ids
}
