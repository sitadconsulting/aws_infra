resource "aws_msk_single_scram_secret_association" "msk_single_scram_secret_association" {
  cluster_arn = var.msk_single_scram_secret_association_cluster_arn
  secret_arn  = var.msk_single_scram_secret_association_secret_arn
}
