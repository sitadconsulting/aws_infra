resource "aws_redshift_subnet_group" "redshift_subnet_group" {
  description = var.redshift_subnet_group_description
  name        = var.redshift_subnet_group_name
  subnet_ids  = var.redshift_subnet_group_subnet_ids
  tags        = var.redshift_subnet_group_tags
}
