variable "autoscaling_group_availability_zones" {
  description = "A list of Availability Zones where instances in the Auto Scaling group can be created. Used for launching into the default VPC subnet in each Availability Zone when not using the vpc_zone_identifier attribute, or for attaching a network interface when an existing network interface ID is specified in a launch template. Conflicts with vpc_zone_identifier"
  type        = list(string)
  default     = null
}
variable "autoscaling_group_capacity_rebalance" {
  description = "Whether capacity rebalance is enabled. Otherwise, capacity rebalance is disabled"
  type        = bool
  default     = null
}
variable "autoscaling_group_context" {
  description = "Reserved"
  type        = string
  default     = ""
}
variable "autoscaling_group_default_cooldown" {
  description = "Amount of time, in seconds, after a scaling activity completes before another scaling activity can start"
  type        = number
  default     = null
}
variable "autoscaling_group_default_instance_warmup" {
  description = "Amount of time, in seconds, until a newly launched instance can contribute to the Amazon CloudWatch metrics. This delay lets an instance finish initializing before Amazon EC2 Auto Scaling aggregates instance metrics, resulting in more reliable usage data. Set this value equal to the amount of time that it takes for resource consumption to become stable after an instance reaches the InService state"
  type        = number
  default     = null
}
variable "autoscaling_group_desired_capacity" {
  description = "Number of Amazon EC2 instances that should be running in the group"
  type        = number
  default     = null
}
variable "autoscaling_group_desired_capacity_type" {
  description = "The unit of measurement for the value specified for desired_capacity. Valid values: \"units\", \"vcpu\", \"memory-mib\""
  type        = string
  default     = null
}
variable "autoscaling_group_enabled_metrics" {
  description = "List of metrics to collect. The allowed values are defined by the underlying AWS API"
  type        = list(string)
  default     = []
}
variable "autoscaling_group_force_delete" {
  description = "Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. You can force an Auto Scaling Group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling"
  type        = bool
  default     = false
}
variable "autoscaling_group_force_delete_warm_pool" {
  description = "Whether to force deleting of warm pool"
  type        = bool
  default     = false
}
variable "autoscaling_group_health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}
variable "autoscaling_group_health_check_type" {
  description = "\"EC2\" or \"ELB\". Controls how health checking is done"
  type        = string
  default     = null
}
variable "autoscaling_group_launch_configuration" {
  description = "Name of the launch configuration to use"
  type        = string
  default     = null
}
variable "autoscaling_group_load_balancers" {
  description = "List of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target_group_arns instead"
  type        = list(string)
  default     = []
}
variable "autoscaling_group_max_instance_lifetime" {
  description = "Maximum amount of time, in seconds, that an instance can be in service, values must be either equal to 0 or between 86400 and 31536000 seconds"
  type        = number
  default     = null
}
variable "autoscaling_group_max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}
variable "autoscaling_group_metrics_granularity" {
  description = "Granularity to associate with the metrics to collect. The only valid value is 1Minute. Default is 1Minute"
  type        = string
  default     = null
}
variable "autoscaling_group_min_elb_capacity" {
  description = "Setting this causes Terraform to wait for this number of instances from this Auto Scaling Group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
  type        = number
  default     = null
}
variable "autoscaling_group_min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}
variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group. By default generated by Terraform. Conflicts with name_prefix"
  type        = string
  default     = null
}
variable "autoscaling_group_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}
variable "autoscaling_group_placement_group" {
  description = "Name of the placement group into which you'll launch your instances, if any"
  type        = string
  default     = null
}
variable "autoscaling_group_protect_from_scale_in" {
  description = "Whether newly launched instances are automatically protected from termination by Amazon EC2 Auto Scaling when scaling in"
  type        = bool
  default     = false
}
variable "autoscaling_group_service_linked_role_arn" {
  description = "ARN of the service-linked role that the ASG will use to call other AWS services"
  type        = string
  default     = null
}
variable "autoscaling_group_suspended_processes" {
  description = "List of processes to suspend for the Auto Scaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer, InstanceRefresh. Note that if you suspend either the Launch or Terminate process types, it can prevent your Auto Scaling Group from functioning properly"
  type        = list(string)
  default     = []
}
variable "autoscaling_group_target_group_arns" {
  description = "Set of aws_alb_target_group ARNs, for use with Application or Network Load Balancing"
  type        = list(string)
  default     = []
}
variable "autoscaling_group_termination_policies" {
  description = "List of policies to decide how the instances in the Auto Scaling Group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default. Additionally, the ARN of a Lambda function can be specified for custom termination policies"
  type        = list(string)
  default     = []
}
variable "autoscaling_group_vpc_zone_identifier" {
  description = "List of subnet IDs to launch resources in. Subnets automatically determine which availability zones the group will reside. Conflicts with availability_zones"
  type        = list(string)
  default     = null
}
variable "autoscaling_group_wait_for_capacity_timeout" {
  description = "Maximum duration that Terraform should wait for ASG instances to be healthy before timing out. Setting this to \"0\" causes Terraform to skip all Capacity Waiting behavior"
  type        = string
  default     = "10m"
}
variable "autoscaling_group_wait_for_elb_capacity" {
  description = "Setting this will cause Terraform to wait for exactly this number of healthy instances from this Auto Scaling Group in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior)"
  type        = number
  default     = null
}
variable "autoscaling_group_initial_lifecycle_hook" {
  description = " One or more Lifecycle Hooks to attach to the Auto Scaling Group before instances are launched. The syntax is exactly the same as the separate aws_autoscaling_lifecycle_hook resource, without the autoscaling_group_name attribute. Please note that this will only work when creating a new Auto Scaling Group. For all other use-cases, please use aws_autoscaling_lifecycle_hook resource"
  type        = list(object({
    default_result          = optional(string)
    heartbeat_timeout       = optional(number)
    lifecycle_transition    = string
    name                    = string
    notification_metadata   = optional(string)
    notification_target_arn = optional(string)
    role_arn                = optional(string)
  }))
  default     = []
}
variable "autoscaling_group_instance_refresh" {
  description = "If this block is configured, start an Instance Refresh when this Auto Scaling Group is updated"
  type        = list(object({
    strategy  = string
    triggers  = optional(list(string))
    preferences = optional(list(object({
      auto_rollback          = optional(bool)
      checkpoint_delay       = optional(number)
      checkpoint_percentages = optional(list(number))
      instance_warmup        = optional(number)
      min_healthy_percentage = optional(number)
      skip_matching          = optional(bool)
    })), [])
  }))
  default     = []
}
variable "autoscaling_group_launch_template" {
  description = "Launch template specification to use to launch instances"
  type        = list(object({
    id      = optional(string)
    name    = optional(string)
    version = optional(string)
  }))
  default     = []
}
variable "autoscaling_group_mixed_instances_policy" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
  type        = list(object({
    instances_distribution = optional(list(object({
      on_demand_allocation_strategy            = optional(string)
      on_demand_base_capacity                  = optional(number)
      on_demand_percentage_above_base_capacity = optional(number)
      spot_allocation_strategy                 = optional(string)
      spot_instance_pools                      = optional(number)
      spot_max_price                           = optional(string)
    })),[])
    launch_template       = list(object({
      launch_template_specification = list(object({
        launch_template_id   = optional(string)
        launch_template_name = optional(string)
        version              = optional(string)
      }))
      override                      = optional(list(object({
        instance_type     = optional(string)
        weighted_capacity = optional(string)
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
          accelerator_count   = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          accelerator_total_memory_mib = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          baseline_ebs_bandwidth_mbps  = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          memory_gib_per_vcpu          = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          memory_mib                   = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          network_bandwidth_gbps       = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          network_interface_count      = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          total_local_storage_gb       = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
          vcpu_count                   = optional(list(object({
            max = optional(number)
            min = optional(number)
          })), [])
        })), [])
        launch_template_specification = optional(list(object({
          launch_template_id   = optional(string)
          launch_template_name = optional(string)
          version              = optional(string)
        })), [])
      })), [])
    }))
  }))
  default     = []
}
variable "autoscaling_group_tag" {
  description = "Configuration block(s) containing resource tags"
  type        = list(object({
    key                 = string
    propagate_at_launch = bool
    value               = string
  }))
  default     = []
}
variable "autoscaling_group_warm_pool" {
  description = "If this block is configured, add a Warm Pool to the specified Auto Scaling group"
  type        = list(object({
    max_group_prepared_capacity = optional(number)
    min_size                    = optional(number)
    pool_state                  = optional(string)
    instance_reuse_policy = optional(list(object({
      reuse_on_scale_in = optional(bool)
    })), [])
  }))
  default     = []
}
