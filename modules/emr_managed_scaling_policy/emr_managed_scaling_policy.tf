resource "aws_emr_managed_scaling_policy" "emr_managed_scaling_policy" {
  cluster_id                    = var.emr_managed_scaling_policy_cluster_id
  scaling_strategy              = var.emr_managed_scaling_policy_scaling_strategy
  utilization_performance_index = var.emr_managed_scaling_policy_utilization_performance_index

  dynamic "compute_limits" {
    for_each = var.emr_managed_scaling_policy_compute_limits
      content {
        maximum_capacity_units          = compute_limits.value["maximum_capacity_units"] 
        maximum_core_capacity_units     = compute_limits.value["maximum_core_capacity_units"]
        maximum_ondemand_capacity_units = compute_limits.value["maximum_ondemand_capacity_units"]
        minimum_capacity_units          = compute_limits.value["minimum_capacity_units"]
        unit_type                       = compute_limits.value["unit_type"]
      }
  }
}
