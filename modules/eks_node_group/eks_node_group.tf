resource "aws_eks_node_group" "eks_node_group" {
  ami_type               = var.eks_node_group_ami_type
  capacity_type          = var.eks_node_group_capacity_type
  cluster_name           = var.eks_node_group_cluster_name
  disk_size              = var.eks_node_group_disk_size
  force_update_version   = var.eks_node_group_force_update_version
  instance_types         = var.eks_node_group_instance_types
  labels                 = var.eks_node_group_labels
  node_group_name        = var.eks_node_group_node_group_name
  node_group_name_prefix = var.eks_node_group_node_group_name_prefix
  node_role_arn          = var.eks_node_group_node_role_arn
  release_version        = var.eks_node_group_release_version
  subnet_ids             = var.eks_node_group_subnet_ids 
  tags                   = var.eks_node_group_tags
  version                = var.eks_node_group_version

  dynamic "launch_template" {
    for_each = var.eks_node_group_launch_template
      content {
        id      = launch_template.value["id"]
        name    = launch_template.value["name"]
        version = launch_template.value["version"]
      }
  }
  dynamic "node_repair_config" {
    for_each = var.eks_node_group_node_repair_config
      content {
        enabled = node_repair_config.value["enabled"]
        max_parallel_nodes_repaired_count       = node_repair_config.value["max_parallel_nodes_repaired_count"]
        max_parallel_nodes_repaired_percentage  = node_repair_config.value["max_parallel_nodes_repaired_percentage"]
        max_unhealthy_node_threshold_count      = node_repair_config.value["max_unhealthy_node_threshold_count"]
        max_unhealthy_node_threshold_percentage = node_repair_config.value["max_unhealthy_node_threshold_percentage"]
        dynamic "node_repair_config_overrides" {
          for_each = node_repair_config.value.node_repair_config_overrides
            content {
              min_repair_wait_time_mins = node_repair_config_overrides.value["min_repair_wait_time_mins"]
              node_monitoring_condition = node_repair_config_overrides.value["node_monitoring_condition"]
              node_unhealthy_reason     = node_repair_config_overrides.value["node_unhealthy_reason"]
              repair_action             = node_repair_config_overrides.value["repair_action"]
            }
        }
      }
  }
  dynamic "remote_access" {
    for_each = var.eks_node_group_remote_access
      content {
        ec2_ssh_key               = remote_access.value["ec2_ssh_key"]
        source_security_group_ids = remote_access.value["source_security_group_ids"]
      }
  }
  dynamic "scaling_config" {
    for_each = var.eks_node_group_scaling_config
      content {
        desired_size = scaling_config.value["desired_size"]
        max_size     = scaling_config.value["max_size"]
        min_size     = scaling_config.value["min_size"] 
      }
  }
  dynamic "taint" {
    for_each = var.eks_node_group_taint
      content {
        key    = taint.value["key"]
        value  = taint.value["value"]
        effect = taint.value["effect"]
      }
  }
  dynamic "update_config" {
    for_each = var.eks_node_group_update_config
      content {
        max_unavailable            = update_config.value["max_unavailable"]
        max_unavailable_percentage = update_config.value["max_unavailable_percentage"]
        update_strategy            = update_config.value["update_strategy"]
      }
  }
  dynamic "warm_pool_config" {
    for_each = var.eks_node_group_warm_pool_config
      content {
        max_group_prepared_capacity = warm_pool_config.value["max_group_prepared_capacity"]
        min_size                    = warm_pool_config.value["min_size"]
        pool_state                  = warm_pool_config.value["pool_state"]
        reuse_on_scale_in           = warm_pool_config.value["reuse_on_scale_in"]
      }
  }
}
