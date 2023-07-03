resource "aws_rds_cluster_role_association" "rds_cluster_role_association" {
  db_cluster_identifier = var.rds_cluster_role_association_db_cluster_identifier
  feature_name          = var.rds_cluster_role_association_feature_name
  role_arn              = var.rds_cluster_role_association_role_arn
}
