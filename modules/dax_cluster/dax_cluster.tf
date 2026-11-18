resource "aws_dax_cluster" "dax_cluster" {
  cluster_endpoint_encryption_type = var.dax_cluster_cluster_endpoint_encryption_type
  cluster_name                     = var.dax_cluster_cluster_name
  iam_role_arn                     = var.dax_cluster_iam_role_arn
  node_type                        = var.dax_cluster_node_type
  replication_factor               = var.dax_cluster_replication_factor
  availability_zones               = var.dax_cluster_availability_zones
  description                      = var.dax_cluster_description
  notification_topic_arn           = var.dax_cluster_notification_topic_arn
  parameter_group_name             = var.dax_cluster_parameter_group_name
  maintenance_window               = var.dax_cluster_maintenance_window
  security_group_ids               = var.dax_cluster_security_group_ids
  subnet_group_name                = var.dax_cluster_subnet_group_name
  tags                             = var.dax_cluster_tags
  
  dynamic "server_side_encryption" {
    for_each = var.dax_cluster_server_side_encryption
      content {
        enabled = server_side_encryption.value["enabled"]
      }
  }
}
