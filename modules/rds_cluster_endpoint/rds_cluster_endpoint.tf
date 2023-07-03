resource "aws_rds_cluster_endpoint" "rds_cluster_endpoint" {
  cluster_identifier          = var.rds_cluster_endpoint_cluster_identifier
  cluster_endpoint_identifier = var.rds_cluster_endpoint_cluster_endpoint_identifier
  custom_endpoint_type        = var.rds_cluster_endpoint_custom_endpoint_type
  static_members              = var.rds_cluster_endpoint_static_members
  excluded_members            = var.rds_cluster_endpoint_excluded_members
  tags                        = var.rds_cluster_endpoint_tags
}
