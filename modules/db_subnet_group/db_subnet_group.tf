resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.db_subnet_group_name
  name_prefix = var.db_subnet_group_name_prefix
  description = var.db_subnet_group_description
  subnet_ids  = var.db_subnet_group_subnet_ids
  tags        = var.db_subnet_group_tags
}
