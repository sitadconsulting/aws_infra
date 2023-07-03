resource "aws_redshift_partner" "redshift_partner" {
  account_id         = var.redshift_partner_account_id
  cluster_identifier = var.redshift_partner_cluster_identifier
  database_name      = var.redshift_partner_database_name
  partner_name       = var.redshift_partner_partner_name
}
