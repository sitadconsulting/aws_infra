resource "aws_redshift_endpoint_authorization" "redshift_endpoint_authorization" {
  account            = var.redshift_endpoint_authorization_account
  cluster_identifier = var.redshift_endpoint_authorization_cluster_identifier
  force_delete       = var.redshift_endpoint_authorization_force_delete
  vpc_ids            = var.redshift_endpoint_authorization_vpc_ids
}
