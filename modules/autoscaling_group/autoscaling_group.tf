resource "aws_autoscaling_group" "autoscaling_group" {
  availability_zones        = var.autoscaling_group_availability_zones
  capacity_rebalance        = var.autoscaling_group_capacity_rebalance
  context                   = var.autoscaling_group_context
  default_cooldown          = var.autoscaling_group_default_cooldown
  default_instance_warmup   = var.autoscaling_group_default_instance_warmup
  desired_capacity          = var.autoscaling_group_desired_capacity
  desired_capacity_type     = var.autoscaling_group_desired_capacity_type
  enabled_metrics           = var.autoscaling_group_enabled_metrics
  force_delete              = var.autoscaling_group_force_delete
  force_delete_warm_pool    = var.autoscaling_group_force_delete_warm_pool
  health_check_grace_period = var.autoscaling_group_health_check_grace_period
  health_check_type         = var.autoscaling_group_health_check_type
  launch_configuration      = var.autoscaling_group_launch_configuration
  load_balancers            = var.autoscaling_group_load_balancers
  max_instance_lifetime     = var.autoscaling_group_max_instance_lifetime
  max_size                  = var.autoscaling_group_max_size
  metrics_granularity       = var.autoscaling_group_metrics_granularity
  min_elb_capacity          = var.autoscaling_group_min_elb_capacity
  min_size                  = var.autoscaling_group_min_size
  name                      = var.autoscaling_group_name
  name_prefix               = var.autoscaling_group_name_prefix
  placement_group           = var.autoscaling_group_placement_group
  protect_from_scale_in     = var.autoscaling_group_protect_from_scale_in
  service_linked_role_arn   = var.autoscaling_group_service_linked_role_arn
  suspended_processes       = var.autoscaling_group_suspended_processes
  target_group_arns         = var.autoscaling_group_target_group_arns
  termination_policies      = var.autoscaling_group_termination_policies
  vpc_zone_identifier       = var.autoscaling_group_vpc_zone_identifier
  wait_for_capacity_timeout = var.autoscaling_group_wait_for_capacity_timeout
  wait_for_elb_capacity     = var.autoscaling_group_wait_for_elb_capacity
  
  dynamic "initial_lifecycle_hook" {
    for_each = var.autoscaling_group_initial_lifecycle_hook
      content {
        heartbeat_timeout       = initial_lifecycle_hook.value["heartbeat_timeout"]
        lifecycle_transition    = initial_lifecycle_hook.value["lifecycle_transition"]
        name                    = initial_lifecycle_hook.value["name"]
        notification_metadata   = initial_lifecycle_hook.value["notification_metadata"]
        notification_target_arn = initial_lifecycle_hook.value["notification_target_arn"]
        role_arn                = initial_lifecycle_hook.value["role_arn"]
      }
  }
  dynamic "instance_refresh" {
    for_each = var.autoscaling_group_instance_refresh
      content {
        strategy = instance_refresh.value["strategy"]
        triggers = instance_refresh.value["triggers"]
        dynamic "preferences" {
          for_each = instance_refresh.value.preferences
            content {
              auto_rollback          = preferences.value["auto_rollback"]
              checkpoint_delay       = preferences.value["checkpoint_delay"]
              checkpoint_percentages = preferences.value["checkpoint_percentages"]
              instance_warmup        = preferences.value["instance_warmup"]
              min_healthy_percentage = preferences.value["min_healthy_percentage"]
              skip_matching          = preferences.value["skip_matching"]
            }
        }
      }
  }
  dynamic "launch_template" {
    for_each = var.autoscaling_group_launch_template
      content {
        id      = launch_template.value["id"]
        name    = launch_template.value["name"]
        version = launch_template.value["version"]
      }
  }
  dynamic "mixed_instances_policy" {
    for_each = var.autoscaling_group_mixed_instances_policy
      content {
        dynamic "instances_distribution" {
          for_each = mixed_instances_policy.value.instances_distribution
            content {
              on_demand_allocation_strategy            = instances_distribution.value["on_demand_allocation_strategy"]
              on_demand_base_capacity                  = instances_distribution.value["on_demand_base_capacity"]
              on_demand_percentage_above_base_capacity = instances_distribution.value["on_demand_percentage_above_base_capacity"]
              spot_allocation_strategy                 = instances_distribution.value["spot_allocation_strategy"]
              spot_instance_pools                      = instances_distribution.value["spot_instance_pools"]
              spot_max_price                           = instances_distribution.value["spot_max_price"]
            }
        }
        dynamic "launch_template" {
          for_each = mixed_instances_policy.value.launch_template
            content {
              dynamic "launch_template_specification" {
                for_each = launch_template.value.launch_template_specification
                  content {
                    launch_template_id   = launch_template_specification.value["launch_template_id"]
                    launch_template_name = launch_template_specification.value["launch_template_name"]
                    version              = launch_template_specification.value["version"]
                  }
              }
              dynamic "override" {
                for_each = launch_template.value.override
                  content {
                    instance_type     = override.value["instance_type"]
                    weighted_capacity = override.value["weighted_capacity"]
                    dynamic "instance_requirements" {
                      for_each = override.value.instance_requirements
                        content {
                          accelerator_manufacturers                        = instance_requirements.value["accelerator_manufacturers"]
                          accelerator_names                                = instance_requirements.value["accelerator_names"]
                          accelerator_types                                = instance_requirements.value["accelerator_types"]
                          allowed_instance_types                           = instance_requirements.value["allowed_instance_types"]
                          bare_metal                                       = instance_requirements.value["bare_metal"]
                          burstable_performance                            = instance_requirements.value["burstable_performance"]
                          cpu_manufacturers                                = instance_requirements.value["cpu_manufacturers"]
                          excluded_instance_types                          = instance_requirements.value["excluded_instance_types"]
                          instance_generations                             = instance_requirements.value["instance_generations"]
                          local_storage                                    = instance_requirements.value["local_storage"]
                          local_storage_types                              = instance_requirements.value["local_storage_types"]
                          on_demand_max_price_percentage_over_lowest_price = instance_requirements.value["on_demand_max_price_percentage_over_lowest_price"]
                          require_hibernate_support                        = instance_requirements.value["require_hibernate_support"]
                          spot_max_price_percentage_over_lowest_price      = instance_requirements.value["spot_max_price_percentage_over_lowest_price"]
                          dynamic "accelerator_count" {
                            for_each = instance_requirements.value.accelerator_count
                              content {
                                max = accelerator_count.value["max"]
                                min = accelerator_count.value["min"]
                              }
                          }
                          dynamic "accelerator_total_memory_mib" {
                            for_each = instance_requirements.value.accelerator_total_memory_mib
                              content {
                                max = accelerator_total_memory_mib.value["max"]
                                min = accelerator_total_memory_mib.value["min"]
                              }
                          }
                          dynamic "baseline_ebs_bandwidth_mbps" {
                            for_each = instance_requirements.value.baseline_ebs_bandwidth_mbps
                              content {
                                max = baseline_ebs_bandwidth_mbps.value["max"]
                                min = baseline_ebs_bandwidth_mbps.value["min"]
                              }
                          }
                          dynamic "memory_gib_per_vcpu" {
                            for_each = instance_requirements.value.memory_gib_per_vcpu
                              content {
                                max = memory_gib_per_vcpu.value["max"]
                                min = memory_gib_per_vcpu.value["min"]
                              }
                          }
                          dynamic "memory_mib" {
                            for_each = instance_requirements.value.memory_mib
                              content {
                                max = memory_mib.value["max"]
                                min = memory_mib.value["min"]
                              }
                          }
                          dynamic "network_bandwidth_gbps" {
                            for_each = instance_requirements.value.network_bandwidth_gbps        
                              content {
                                max = network_bandwidth_gbps.value["max"]
                                min = network_bandwidth_gbps.value["min"]
                              }
                          }
                          dynamic "network_interface_count" {
                            for_each = instance_requirements.value.network_interface_count
                              content {
                                max = network_interface_count.value["max"]
                                min = network_interface_count.value["min"]
                              }
                          }
                          dynamic "total_local_storage_gb" {
                            for_each = instance_requirements.value.total_local_storage_gb
                              content {
                                max = total_local_storage_gb.value["max"]
                                min = total_local_storage_gb.value["min"]
                              }
                          }
                          dynamic "vcpu_count" {
                            for_each = instance_requirements.value.vcpu_count
                              content {
                                max = vcpu_count.value["max"]
                                min = vcpu_count.value["min"]
                              }
                          }
                         
                        }
                    }
                    dynamic "launch_template_specification" {
                      for_each = override.value.launch_template_specification
                        content {
                          launch_template_id   = launch_template_specification.value["launch_template_id"]
                          launch_template_name = launch_template_specification.value["launch_template_name"]
                          version              = launch_template_specification.value["version"]
                        }
                    }
                  }
              }
            }
        }
      }
  }
  dynamic "tag" {
    for_each = var.autoscaling_group_tag
      content {
        key                 = tag.value["key"]
        propagate_at_launch = tag.value["propagate_at_launch"]
        value               = tag.value["value"]
      }
  }
  dynamic "warm_pool" {
    for_each = var.autoscaling_group_warm_pool
      content {
        max_group_prepared_capacity = warm_pool.value["max_group_prepared_capacity"]
        min_size                    = warm_pool.value["min_size"]
        pool_state                  = warm_pool.value["pool_state"]
        dynamic "instance_reuse_policy" {
          for_each = warm_pool.value.instance_reuse_policy
            content {
              reuse_on_scale_in = instance_reuse_policy.value["reuse_on_scale_in"]
            }
        }
      }
  }
  lifecycle {
   ignore_changes = [
     id,
     metrics_granularity,
     name
   ]
  } 
}
