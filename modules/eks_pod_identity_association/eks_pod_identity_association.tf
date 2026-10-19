resource "aws_eks_pod_identity_association" "eks_pod_identity_association" {
  cluster_name         = var.eks_pod_identity_association_cluster_name
  namespace            = var.eks_pod_identity_association_namespace
  role_arn             = var.eks_pod_identity_association_role_arn
  service_account      = var.eks_pod_identity_association_service_account
  disable_session_tags = var.eks_pod_identity_association_disable_session_tags
  policy               = var.eks_pod_identity_association_policy
  tags                 = var.eks_pod_identity_association_tags
  target_role_arn      = var.eks_pod_identity_association_target_role_arn
}
