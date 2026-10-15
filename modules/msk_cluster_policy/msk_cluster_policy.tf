resource "aws_msk_cluster_policy" "msk_cluster_policy" {
  cluster_arn = var.msk_cluster_policy_cluster_arn
  policy      = var.msk_cluster_policy_policy
}
