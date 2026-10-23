variable "spot_fleet_request_allocation_strategy" {
  description = "(Optional) Indicates how to allocate the target capacity across the Spot pools specified by the Spot fleet request. Valid values: lowestPrice, diversified, capacityOptimized, capacityOptimizedPrioritized, and priceCapacityOptimized. The default is lowestPrice"
  type        = string
  default     = null
}
variable "spot_fleet_request_context" {
  description = "(Optional) Reserved"
  type        = string
  default     = null
}
variable "spot_fleet_request_excess_capacity_termination_policy" {
  description = "(Optional) Indicates whether running Spot instances should be terminated if the target capacity of the Spot fleet request is decreased below the current size of the Spot fleet"
  type        = string
  default     = null
}
variable "spot_fleet_request_fleet_type" {
  description = "(Optional) The type of fleet request. Indicates whether the Spot Fleet only requests the target capacity or also attempts to maintain it. Default is maintain"
  type        = string
  default     = null
}
variable "spot_fleet_request_iam_fleet_role" {
  description = "(Required) Grants the Spot fleet permission to terminate Spot instances on your behalf when you cancel its Spot fleet request using CancelSpotFleetRequests or when the Spot fleet request expires, if you set terminateInstancesWithExpiration"
  type        = string
}
variable "spot_fleet_request_instance_interruption_behaviour" {
  description = "(Optional) Indicates whether a Spot instance stops or terminates when it is interrupted. Default is terminate"
  type        = string
  default     = null
}
variable "spot_fleet_request_instance_pools_to_use_count" {
  description = "(Optional; Default: 1) The number of Spot pools across which to allocate your target Spot capacity. Valid only when allocation_strategy is set to lowestPrice. Spot Fleet selects the cheapest Spot pools and evenly allocates your target Spot capacity across the number of Spot pools that you specify"
  type        = number
  default     = null
}
variable "spot_fleet_request_load_balancers" {
  description = "(Optional) A list of elastic load balancer names to add to the Spot fleet"
  type        = list(string)
  default     = null
}
variable "spot_fleet_request_on_demand_allocation_strategy" {
  description = "(Optional) The order of the launch template overrides to use in fulfilling On-Demand capacity. the possible values are: lowestPrice and prioritized. the default is lowestPrice"
  type        = string
  default     = null
}
variable "spot_fleet_request_on_demand_max_total_price" {
  description = "(Optional) The maximum amount per hour for On-Demand Instances that you're willing to pay. When the maximum amount you're willing to pay is reached, the fleet stops launching instances even if it hasn’t met the target capacity"
  type        = string
  default     = null
}
variable "spot_fleet_request_on_demand_target_capacity" {
  description = "(Optional) The number of On-Demand units to request. If the request type is maintain, you can specify a target capacity of 0 and add capacity later"
  type        = number
  default     = null
}
variable "spot_fleet_request_replace_unhealthy_instances" {
  description = "(Optional) Indicates whether Spot fleet should replace unhealthy instances. Default false"
  type        = bool
  default     = false
}
variable "spot_fleet_request_spot_price" {
  description = "(Optional; Default: On-demand price) The maximum bid price per unit hour"
  type        = string
  default     = null
}
variable "spot_fleet_request_tags" {
  description = "(Optional) A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
variable "spot_fleet_request_target_capacity" {
  description = "(Required) The number of units to request. You can choose to set the target capacity in terms of instances or a performance characteristic that is important to your application workload, such as vCPUs, memory, or I/O"
  type        = number
}
variable "spot_fleet_request_target_capacity_unit_type" {
  description = "(Optional) The unit for the target capacity. This can only be done with instance_requirements defined"
  type        = string
  default     = null
}
variable "spot_fleet_request_target_group_arns" {
  description = "(Optional) A list of aws_alb_target_group ARNs, for use with Application Load Balancing"
  type        = list(string)
  default     = null
}
variable "spot_fleet_request_terminate_instances_on_delete" {
  description = "(Optional) Indicates whether running Spot instances should be terminated when the resource is deleted (and the Spot fleet request cancelled). If no value is specified, the value of the terminate_instances_with_expiration argument is used"
  type        = bool
  default     = null
}
variable "spot_fleet_request_terminate_instances_with_expiration" {
  description = "(Optional) Indicates whether running Spot instances should be terminated when the Spot fleet request expires"
  type        = bool
  default     = null
}
variable "spot_fleet_request_valid_from" {
  description = "(Optional) The start date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). The default is to start fulfilling the request immediately"
  type        = string
  default     = null
}
variable "spot_fleet_request_valid_until" {
  description = "(Optional) The end date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new Spot instance requests are placed or enabled to fulfill the request"
  type        = string
  default     = null
}
variable "spot_fleet_request_wait_for_fulfillment" {
  description = "(Optional; Default: false) If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached"
  type        = bool
  default     = false
}
variable "spot_fleet_request_launch_specification" {
  description = "(Optional) Used to define the launch configuration of the spot-fleet request. Can be specified multiple times to define different bids across different markets and instance types. Conflicts with launch_template_config. At least one of launch_specification or launch_template_config is required"
  type        = list(object({
    ami                         = string
    associate_public_ip_address = optional(bool)
    availability_zone           = optional(string)
    ebs_optimized               = optional(bool)
    iam_instance_profile        = optional(string)
    iam_instance_profile_arn    = optional(string)
    instance_type               = optional(string)
    key_name                    = optional(string)
    monitoring                  = optional(bool)
    placement_group             = optional(string)
    placement_tenancy           = optional(string)
    spot_price                  = optional(string)
    subnet_id                   = optional(string)
    tags                        = optional(map(string))
    user_data                   = optional(string)
    vpc_security_groups_ids     = optional(list(string))
    weighted_capacity           = optional(number)
    ebs_block_device            = optional(list(object({
      delete_on_termination = optional(bool)
      device_name           = string
      encrypted             = optional(bool)
      iops                  = optional(number)
      kms_key_id            = optional(string)
      snapshot_id           = optional(string)
      throughput            = optional(number)
      volume_size           = optional(number)
      volume_type           = optional(string)
    })), [])
    ephemeral_block_device      = optional(list(object({
      device_name    = string
      virtual_device = optional(string)
    })), [])
    root_block_device           = optional(list(object({
      delete_on_termination = optional(bool)
      encrypted             = optional(bool)
      iops                  = optional(number)
      kms_key_id            = optional(string)
      throughput            = optional(number)
      volume_size           = optional(number)
      volume_type           = optional(string)
    })), [])
  }))
  default     = []
}
variable "spot_fleet_request_launch_template_config" {
  description = "(Optional) Launch template configuration block. Conflicts with launch_specification. At least one of launch_specification or launch_template_config is required"
  type        = list(object({
    launch_template_specification = optional(list(object({
      id      = optional(string)
      name    = optional(string)
      version = optional(string)
    })), [])
    overrides                     = optional(list(object({
      availability_zone = optional(string)
      instance_type     = optional(string)
      priority          = optional(number)
      spot_price        = optional(string)
      subnet_id         = optional(string)
      weighted_capacity = optional(number)
      instance_requirements = optional(list(object({
        accelerator_manufacturers                        = optional(list(string))
        accelerator_names                                = optional(list(string))
        accelerator_types                                = optional(list(string))
        allowed_instance_types                           = optional(list(string))
        bare_metal                                       = optional(string)
        burstable_performance                            = optional(string)
        cpu_manufacturers                                = optional(list(string))
        excluded_instance_types                          = optional(list(string))
        instance_generations                             = optional(list(string))
        local_storage                                    = optional(string)
        local_storage_types                              = optional(list(string))
        on_demand_max_price_percentage_over_lowest_price = optional(number)
        require_hibernate_support                        = optional(bool)
        spot_max_price_percentage_over_lowest_price      = optional(number)
        accelerator_count                                = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        accelerator_total_memory_mib                     = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        baseline_ebs_bandwidth_mbps                      = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        memory_gib_per_vcpu                              = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        memory_mib                                       = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        network_bandwidth_gbps                           = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        network_interface_count                          = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        total_local_storage_gb                           = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        vcpu_count                                       = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
      })), [])
    })), [])
  }))
  default     = []
}
variable "spot_fleet_request_spot_maintenance_strategies" {
  description = "(Optional) Nested argument containing maintenance strategies for managing your Spot Instances that are at an elevated risk of being interrupted"
  type        = list(object({
    capacity_rebalance = optional(list(object({
      replacement_strategy = optional(string)
    })), [])
  }))
  default     = []
}
