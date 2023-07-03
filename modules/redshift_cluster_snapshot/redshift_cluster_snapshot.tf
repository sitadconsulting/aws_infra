resource "aws_redshift_cluster_snapshot" "redshift_cluster_snapshot" {
  cluster_identifier               = var.redshift_cluster_snapshot_cluster_identifier
  manual_snapshot_retention_period = var.redshift_cluster_snapshot_manual_snapshot_retention_period
  snapshot_identifier              = var.redshift_cluster_snapshot_snapshot_identifier
  tags                             = var.redshift_cluster_snapshot_tags

}
