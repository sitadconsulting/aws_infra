resource "aws_eks_addon" "eks_addon" {
  addon_name                  = var.eks_addon_addon_name
  addon_version               = var.eks_addon_addon_version
  cluster_name                = var.eks_addon_cluster_name
  configuration_values        = var.eks_addon_configuration_values 
  resolve_conflicts_on_create = var.eks_addon_resolve_conflicts_on_create 
  resolve_conflicts_on_update = var.eks_addon_resolve_conflicts_on_update
  tags                        = var.eks_addon_tags
  preserve                    = var.eks_addon_preserve
  service_account_role_arn    = var.eks_addon_service_account_role_arn
}
