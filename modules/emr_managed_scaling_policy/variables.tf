variable "emr_managed_scaling_policy_cluster_id" {
  description = "(Required) ID of the EMR cluster"
  type        = string
}
variable "emr_managed_scaling_policy_scaling_strategy" {
  description = "(Optional) Specifies the scaling strategy. When set to ADVANCED, the utilization_performance_index argument can be used to configure an advanced scaling strategy. An advanced scaling strategy requires Amazon EMR on EC2 version 7.0 or later. Valid values: ADVANCED, DEFAULT"
  type        = string
  default     = null
}
variable "emr_managed_scaling_policy_utilization_performance_index" {
  description = "(Optional) Integer value that represents the advanced scaling strategy. Higher values optimize for performance, while lower values optimize for resource conservation. A value of 50 provides a balance between performance and resource conservation. Required when scaling_strategy is set to ADVANCED. Valid values: 1, 25, 50, 75, 100"
  type        = number
  default     = null
}
variable "emr_managed_scaling_policy_compute_limits" {
  description = "(Required) Configuration block with compute limit settings"
  type        = list(object({
    maximum_capacity_units          = number
    maximum_core_capacity_units     = optional(number)
    maximum_ondemand_capacity_units = optional(number)
    minimum_capacity_units          = number
    unit_type                       = string
  }))
}
