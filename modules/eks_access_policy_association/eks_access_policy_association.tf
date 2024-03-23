resource "aws_eks_access_policy_association" "eks_access_policy_association" {
  cluster_name  = var.eks_access_policy_association_cluster_name
  policy_arn    = var.eks_access_policy_association_policy_arn
  principal_arn = var.eks_access_policy_association_principal_arn

  dynamic "access_scope" {
    for_each = var.eks_access_policy_association_access_scope
      content {
        type       = access_scope.value["type"]
        namespaces = access_scope.value["namespaces"]
      }
  }
}
