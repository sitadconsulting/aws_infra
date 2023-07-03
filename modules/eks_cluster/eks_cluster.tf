resource "aws_eks_cluster" "eks_cluster" {
  enabled_cluster_log_types = var.eks_cluster_enabled_cluster_log_types
  name                      = var.eks_cluster_name
  role_arn                  = var.eks_cluster_role_arn
  tags                      = var.eks_cluster_tags
  version                   = var.eks_cluster_version
  

  dynamic "encryption_config" {
    for_each = var.eks_cluster_encryption_config
      content {
        resources = encryption_config.value["resources"]
        dynamic "provider" {
          for_each = encryption_config.value.provider
            content {
              key_arn = provider.value["key_arn"]
            }
        }
      }
  }
  dynamic "kubernetes_network_config" {
    for_each = var.eks_cluster_kubernetes_network_config
      content {
        ip_family         = kubernetes_network_config.value["ip_family"]
        service_ipv4_cidr = kubernetes_network_config.value["service_ipv4_cidr"]
      }
  }
  dynamic "outpost_config" {
    for_each = var.eks_cluster_outpost_config
      content {
        control_plane_instance_type = outpost_config.value["control_plane_instance_type"]
        outpost_arns                = outpost_config.value["outpost_arns"]
        dynamic "control_plane_placement" {
          for_each = outpost_config.value.control_plane_placement
            content {
              group_name = control_plane_placement.value["group_name"]
            }
        }
      }
  }
  dynamic "vpc_config" {
    for_each = var.eks_cluster_vpc_config
      content {
        endpoint_private_access = vpc_config.value["endpoint_private_access"]
        endpoint_public_access  = vpc_config.value["endpoint_public_access"]
        public_access_cidrs     = vpc_config.value["public_access_cidrs"]
        security_group_ids      = vpc_config.value["security_group_ids"]
        subnet_ids              = vpc_config.value["subnet_ids"]
      }
  }
  lifecycle {
    ignore_changes = all
  }
}

