resource "aws_dax_subnet_group" "dax_subnet_group" {
  description = var.dax_subnet_group_description
  name        = var.dax_subnet_group_name
  subnet_ids  = var.dax_subnet_group_subnet_ids
}
