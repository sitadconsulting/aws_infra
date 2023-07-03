resource "aws_db_proxy_target" "db_proxy_target" {
  db_proxy_name          = var.db_proxy_target_db_proxy_name
  target_group_name      = var.db_proxy_target_target_group_name
  db_instance_identifier = var.db_proxy_target_db_instance_identifier
  db_cluster_identifier  = var.db_proxy_target_db_cluster_identifier
}
