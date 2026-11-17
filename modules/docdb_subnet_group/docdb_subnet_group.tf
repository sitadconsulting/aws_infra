resource "aws_docdb_subnet_group" "docdb_subnet_group" {
  description = var.docdb_subnet_group_description
  name        = var.docdb_subnet_group_name
  name_prefix = var.docdb_subnet_group_name_prefix
  subnet_ids  = var.docdb_subnet_group_subnet_ids
  tags        = var.docdb_subnet_group_tags
}
