resource "aws_docdbelastic_cluster" "docdbelastic_cluster" {
  admin_user_name              = var.docdbelastic_cluster_admin_user_name
  admin_user_password          = var.docdbelastic_cluster_admin_user_password
  auth_type                    = var.docdbelastic_cluster_auth_type
  backup_retention_period      = var.docdbelastic_cluster_backup_retention_period
  kms_key_id                   = var.docdbelastic_cluster_kms_key_id
  name                         = var.docdbelastic_cluster_name
  preferred_backup_window      = var.docdbelastic_cluster_preferred_backup_window
  preferred_maintenance_window = var.docdbelastic_cluster_preferred_maintenance_window
  shard_capacity               = var.docdbelastic_cluster_shard_capacity
  shard_count                  = var.docdbelastic_cluster_shard_count
  shard_instance_count         = var.docdbelastic_cluster_shard_instance_count
  subnet_ids                   = var.docdbelastic_cluster_subnet_ids
  tags                         = var.docdbelastic_cluster_tags
  vpc_security_group_ids       = var.docdbelastic_cluster_vpc_security_group_ids
}
