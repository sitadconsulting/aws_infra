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

  dynamic "launch_template" {
    for_each = var.eks_node_group_launch_template
      content {
        id      = launch_template.value["id"]
        name    = launch_template.value["name"]
        version = launch_template.value["version"]
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
      }
  }

}
