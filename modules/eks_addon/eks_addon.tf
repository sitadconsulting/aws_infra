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


  dynamic "namespace_config" {
    for_each = var.eks_addon_namespace_config
      content {
        namespace = namespace_config.value["namespace"]      
      }
  }
  dynamic "pod_identity_association" {
    for_each = var.eks_addon_pod_identity_association
      content {
        role_arn        = pod_identity_association.value["role_arn"]
        service_account = pod_identity_association.value["service_account"]
      }
  }
}
