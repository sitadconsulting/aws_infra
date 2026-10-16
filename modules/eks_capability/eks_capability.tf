resource "aws_eks_capability" "eks_capability" {
  capability_name           = var.eks_capability_capability_name
  cluster_name              = var.eks_capability_cluster_name
  delete_propagation_policy = var.eks_capability_delete_propagation_policy
  role_arn                  = var.eks_capability_role_arn
  tags                      = var.eks_capability_tags
  type                      = var.eks_capability_type


  dynamic "configuration" {
    for_each = var.eks_capability_configuration
      content {
        dynamic "argo_cd" {
          for_each = configuration.value.argo_cd
            content {
              namespace = argo_cd.value["namespace"]
              dynamic "aws_idc" {
                for_each = argo_cd.value.aws_idc
                  content {
                    idc_instance_arn = aws_idc.value["idc_instance_arn"]
                    idc_region       = aws_idc.value["idc_region"]
                  }
              }
              dynamic "network_access" {
                for_each = argo_cd.value.network_access
                  content {
                    vpce_ids = network_access.value["vpce_ids"]
                  }
              }
              dynamic "rbac_role_mapping" {
                for_each = argo_cd.value.rbac_role_mapping
                  content {
                    role  = rbac_role_mapping.value["role"]
                    dynamic "identity" {
                      for_each = rbac_role_mapping.value.identity
                        content {
                          id   = identity.value["id"]
                          type = identity.value["type"]
                        }
                    }
                  }
              }
            }
        }
      }
  } 
}
