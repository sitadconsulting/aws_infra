resource "aws_dms_replication_subnet_group" "dms_replication_subnet_group" {
  replication_subnet_group_description = var.dms_replication_subnet_group_replication_subnet_group_description
  replication_subnet_group_id          = var.dms_replication_subnet_group_replication_subnet_group_id
  subnet_ids                           = var.dms_replication_subnet_group_subnet_ids
  tags                                 = var.dms_replication_subnet_group_tags
}
