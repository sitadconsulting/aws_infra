resource "aws_eks_fargate_profile" "eks_fargate_profile" {
  cluster_name           = var.eks_fargate_profile_cluster_name
  fargate_profile_name   = var.eks_fargate_profile_fargate_profile_name
  pod_execution_role_arn = var.eks_fargate_profile_pod_execution_role_arn
  subnet_ids             = var.eks_fargate_profile_subnet_ids
  tags                   = var.eks_fargate_profile_tags

  dynamic "selector" {
    for_each = var.eks_fargate_profile_selector
      content {
        namespace = selector.value["namespace"]
        labels    = selector.value["labels"]
        region    = selector.value["region"]
      }
  }
}
