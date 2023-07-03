resource "aws_msk_scram_secret_association" "msk_scram_secret_association" {
  cluster_arn     = var.msk_scram_secret_association_cluster_arn
  secret_arn_list = var.msk_scram_secret_association_secret_arn_list
}
