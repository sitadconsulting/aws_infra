resource "aws_eks_access_entry" "eks_access_entry" {
  cluster_name      = var.eks_access_entry_cluster_name
  principal_arn     = var.eks_access_entry_principal_arn
  kubernetes_groups = var.eks_access_entry_kubernetes_groups
  tags              = var.eks_access_entry_tags
  type              = var.eks_access_entry_type
  user_name         = var.eks_access_entry_user_name
}
