variable "emr_instance_fleet_cluster_id" {
  description = "(Required) ID of the EMR Cluster to attach to. Changing this forces a new resource to be created"
  type        = string
}
variable "emr_instance_fleet_name" {
  description = "(Optional) Friendly name given to the instance fleet"
  type        = string
  default     = null
}
variable "emr_instance_fleet_target_on_demand_capacity" {
  description = "(Optional) The target capacity of On-Demand units for the instance fleet, which determines how many On-Demand instances to provision"
  type        = number
  default     = null
}
variable "emr_instance_fleet_target_spot_capacity" {
  description = "(Optional) The target capacity of Spot units for the instance fleet, which determines how many Spot instances to provision"
  type        = number
  default     = null
}
variable "emr_instance_fleet_instance_type_configs" {
  description = "(Optional) Configuration block for instance fleet"
  type        = list(object({
    bid_price                                  = optional(string)
    bid_price_as_percentage_of_on_demand_price = optional(number)
    instance_type                              = string
    weighted_capacity                          = optional(number)
    configurations                             = optional(list(object({
      classification = optional(string)
      properties     = optional(map(string))
    })), [])
    ebs_config                                 = optional(list(object({
      iops                 = optional(number)
      size                 = number
      type                 = string
      volumes_per_instance = optional(number)
    })), []) 
  }))
  default     = []
}
variable "emr_instance_fleet_launch_specifications" {
  description = "(Optional) Configuration block for launch specification"
  type        = list(object({
    on_demand_specification = optional(list(object({
      allocation_strategy = string
    })), [])
    spot_specification      = optional(list(object({
      allocation_strategy      = string
      block_duration_minutes   = optional(number)
      timeout_action           = string
      timeout_duration_minutes = number
    })), [])
  }))
  default     = []
}
