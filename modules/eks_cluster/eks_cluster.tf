resource "aws_eks_cluster" "eks_cluster" {
  bootstrap_self_managed_addons = var.eks_cluster_bootstrap_self_managed_addons
  deletion_protection           = var.eks_cluster_deletion_protection
  enabled_cluster_log_types     = var.eks_cluster_enabled_cluster_log_types
  force_update_version          = var.eks_cluster_force_update_version
  name                          = var.eks_cluster_name
  role_arn                      = var.eks_cluster_role_arn
  tags                          = var.eks_cluster_tags
  version                       = var.eks_cluster_version

  dynamic "access_config" {
    for_each = var.eks_cluster_access_config
      content {
        authentication_mode                         = access_config.value["authentication_mode"]
        bootstrap_cluster_creator_admin_permissions = access_config.value["bootstrap_cluster_creator_admin_permissions"]
      }
  }
  dynamic "compute_config" {
    for_each = var.eks_cluster_compute_config
      content {
        enabled       = compute_config.value["enabled"]
        node_pools    = compute_config.value["node_pools"]
        node_role_arn = compute_config.value["node_role_arn"]
      }
  }
  dynamic "control_plane_scaling_config" {
    for_each = var.eks_cluster_control_plane_scaling_config
      content {
        tier = control_plane_scaling_config.value["tier"]
      }
  }
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
        ip_family              = kubernetes_network_config.value["ip_family"]
        service_ipv4_cidr      = kubernetes_network_config.value["service_ipv4_cidr"]
        service_ipv6_cidr      = kubernetes_network_config.value["service_ipv6_cidr"]
        dynamic "elastic_load_balancing" {
          for_each = kubernetes_network_config.value.elastic_load_balancing
            content {
              enabled = elastic_load_balancing.value["enabled"]
            }
        }
      }
  }
  dynamic "kube_api_server_config" {
    for_each = var.eks_cluster_kube_api_server_config
      content {
        event_ttl = kube_api_server_config.value["event_ttl"]
        dynamic "service_node_port_range" {
          for_each = kube_api_server_config.value.service_node_port_range
            content {
              min_port = service_node_port_range.value["min_port"]
              max_port = service_node_port_range.value["max_port"]
            }
        }
      }
  }
  dynamic "kube_controller_manager_config" {
    for_each = var.eks_cluster_kube_controller_manager_config
      content {
        dynamic "horizontal_pod_autoscaler_controller_config" {
          for_each = kube_controller_manager_config.value.horizontal_pod_autoscaler_controller_config
            content {
              horizontal_pod_autoscaler_sync_period = horizontal_pod_autoscaler_controller_config.value["horizontal_pod_autoscaler_sync_period"]
            }
        }
        dynamic "pod_gc_controller_config" {
          for_each = kube_controller_manager_config.value.pod_gc_controller_config
            content {
              terminated_pod_gc_threshold = pod_gc_controller_config.value["terminated_pod_gc_threshold"]
            }
        }
      }
  }
  dynamic "kube_scheduler_config" {
    for_each = var.eks_cluster_kube_scheduler_config
      content {
        dynamic "node_resources_fit" {
          for_each = kube_scheduler_config.value.node_resources_fit
            content {
              dynamic "scoring_strategy" {
                for_each = node_resources_fit.value.scoring_strategy
                  content {
                    type   = scoring_strategy.value["type"]
                    dynamic "resource" {
                      for_each = scoring_strategy.value.resource
                        content {
                          name   = resource.value["name"]
                          weight = resource.value["weight"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "outpost_config" {
    for_each = var.eks_cluster_outpost_config
      content {
        control_plane_instance_type = outpost_config.value["control_plane_instance_type"]
        etcd_instance_type          = outpost_config.value["etcd_instance_type"]
        outpost_arns                = outpost_config.value["outpost_arns"]
        dynamic "control_plane_placement" {
          for_each = outpost_config.value.control_plane_placement
            content {
              group_name   = control_plane_placement.value["group_name"]
              spread_level = control_plane_placement.value["spread_level"]
            }
        }
      }
  }
  dynamic "remote_network_config" {
    for_each = var.eks_cluster_remote_network_config
      content {
        dynamic "remote_node_networks" {
          for_each = remote_network_config.value.remote_node_networks
            content {
              cidrs = remote_node_networks.value["cidrs"]
            }
        }
        dynamic "remote_pod_networks" {
          for_each = remote_network_config.value.remote_pod_networks
            content {
              cidrs = remote_pod_networks.value["cidrs"]
            }
        }
      }
  }
  dynamic "storage_config" {
    for_each = var.eks_cluster_storage_config
      content {
        dynamic "block_storage" {
          for_each = storage_config.value.block_storage
            content {
              enabled = block_storage.value["enabled"]
            }
        }
      }
  }
  dynamic "upgrade_policy" {
    for_each = var.eks_cluster_upgrade_policy
      content {
        support_type = upgrade_policy.value["support_type"]
      }
  }
  dynamic "vpc_config" {
    for_each = var.eks_cluster_vpc_config
      content {
        control_plane_egress_mode = vpc_config.value["control_plane_egress_mode"]
        endpoint_private_access   = vpc_config.value["endpoint_private_access"]
        endpoint_public_access    = vpc_config.value["endpoint_public_access"]
        public_access_cidrs       = vpc_config.value["public_access_cidrs"]
        security_group_ids        = vpc_config.value["security_group_ids"]
        subnet_ids                = vpc_config.value["subnet_ids"]
      }
  }
  dynamic "zonal_shift_config" {
    for_each = var.eks_cluster_zonal_shift_config
      content {
        enabled = zonal_shift_config.value["enabled"]
      }
  }
}

