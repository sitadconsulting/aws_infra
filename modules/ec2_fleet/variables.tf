variable "ec2_fleet_context" {
  description = "(Optional) Reserved"
  type        = string
  default     = null
}
variable "ec2_fleet_excess_capacity_termination_policy" {
  description = "(Optional) Whether running instances should be terminated if the total target capacity of the EC2 Fleet is decreased below the current size of the EC2. Valid values: no-termination, termination. Defaults to termination. Supported only for fleets of type maintain"
  type        = string
  default     ="termination"
}
variable "ec2_fleet_replace_unhealthy_instances" {
  description = "(Optional) Whether EC2 Fleet should replace unhealthy instances. Defaults to false. Supported only for fleets of type maintain"
  type        = bool
  default     = false
}
variable "ec2_fleet_tags" {
  description = " (Optional) Map of Fleet tags. To tag instances at launch, specify the tags in the Launch Template. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level"
  type        = map(string)
  default     = {}
}
variable "ec2_fleet_terminate_instances" {
  description = "(Optional) Whether to terminate instances for an EC2 Fleet if it is deleted successfully. Defaults to false"
  type        = bool
  default     = false
}
variable "ec2_fleet_terminate_instances_with_expiration" {
  description = "(Optional) Whether running instances should be terminated when the EC2 Fleet expires. Defaults to false"
  type        = bool
  default     = false
}
variable "ec2_fleet_type" {
  description = "(Optional) The type of request. Indicates whether the EC2 Fleet only requests the target capacity, or also attempts to maintain it. Valid values: maintain, request, instant. Defaults to maintain"
  type        = string
  default     = null
}
variable "ec2_fleet_valid_from" {
  description = "(Optional) The start date and time of the request, in UTC format (for example, YYYY-MM-DDTHH:MM:SSZ). The default is to start fulfilling the request immediately"
  type        = string
  default     = null
}
variable "ec2_fleet_valid_until" {
  description = "(Optional) The end date and time of the request, in UTC format (for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new EC2 Fleet requests are placed or able to fulfill the request. If no value is specified, the request remains until you cancel it"
  type        = string
  default     = null
}
variable "ec2_fleet_launch_template_config" {
  description = "(Required) Nested argument containing EC2 Launch Template configurations"
  type        = list(object({
    launch_template_specification = optional(list(object({
      launch_template_id   = optional(string)
      launch_template_name = optional(string)
      version              = string
    })), [])
    override = optional(list(object({
      availability_zone = optional(string)
      instance_type     = optional(string)
      max_price         = optional(string)
      priority          = optional(number)
      subnet_id         = optional(string)
      weighted_capacity = optional(number) 
      instance_requirements = optional(list(object({
        accelerator_manufacturers                               = optional(list(string))
        accelerator_names                                       = optional(list(string))
        accelerator_types                                       = optional(list(string))
        allowed_instance_types                                  = optional(list(string))
        bare_metal                                              = optional(string)
        burstable_performance                                   = optional(string)
        cpu_manufacturers                                       = optional(list(string))
        excluded_instance_types                                 = optional(list(string))
        instance_generations                                    = optional(list(string))
        local_storage                                           = optional(string)
        local_storage_types                                     = optional(list(string))
        max_spot_price_as_percentage_of_optimal_on_demand_price = optional(number)
        on_demand_max_price_percentage_over_lowest_price        = optional(number)
        require_hibernate_support                               = optional(bool)
        spot_max_price_percentage_over_lowest_price             = optional(number)
        accelerator_count = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        accelerator_total_memory_mib = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        baseline_ebs_bandwidth_mbps = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        memory_gib_per_vcpu = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        memory_mib = list(object({
          max = optional(number)
          min = number
        }))
        network_bandwidth_gbps = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        network_interface_count = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        total_local_storage_gb = optional(list(object({
          max = optional(number)
          min = optional(number)
        })), [])
        vcpu_count = optional(list(object({
          max = optional(number)
          min = number
        })), [])
      })), [])
    })), [])
  }))
}
variable "ec2_fleet_on_demand_options" {
  description = "(Optional) Nested argument containing On-Demand configurations"
  type        = list(object({
    allocation_strategy          = optional(string)
    max_total_price              = optional(string)
    min_target_capacity          = optional(number)
    single_availability_zone     = optional(bool)
    single_instance_type         = optional(bool)
    capacity_reservation_options = optional(list(object({
      usage_strategy = optional(string)
    })), [])
  }))
  default     = []
}
variable "ec2_fleet_spot_options" {
  description = "(Optional) Nested argument containing Spot configurations"
  type        = list(object({
    allocation_strategy            = optional(string)
    instance_interruption_behavior = optional(string)
    instance_pools_to_use_count    = optional(number)
    maintenance_strategies         = optional(list(object({
      capacity_rebalance = optional(list(object({
        replacement_strategy = optional(string)
        termination_delay    = optional(number)
      })), [])
    })), [])
  }))
  default     = []
}
variable "ec2_fleet_target_capacity_specification" {
  description = "(Required) Nested argument containing target capacity configurations"
  type        = list(object({
    default_target_capacity_type = string
    on_demand_target_capacity    = optional(number)
    spot_target_capacity         = optional(number)
    target_capacity_unit_type    = optional(string)
    total_target_capacity        = number
  }))
}
