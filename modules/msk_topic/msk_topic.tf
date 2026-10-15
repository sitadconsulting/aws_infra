resource "aws_msk_topic" "msk_topic" {
  configs            = var.msk_topic_configs
  cluster_arn        = var.msk_topic_cluster_arn
  name               = var.msk_topic_name
  partition_count    = var.msk_topic_partition_count
  replication_factor = var.msk_topic_replication_factor
}
