resource "aws_ec2_fleet" "ec2_fleet" {
  context                             = var.ec2_fleet_context
  excess_capacity_termination_policy  = var.ec2_fleet_excess_capacity_termination_policy
  replace_unhealthy_instances         = var.ec2_fleet_replace_unhealthy_instances
  tags                                = var.ec2_fleet_tags
  terminate_instances                 = var.ec2_fleet_terminate_instances
  terminate_instances_with_expiration = var.ec2_fleet_terminate_instances_with_expiration
  type                                = var.ec2_fleet_tyoe
  valid_from                          = var.ec2_fleet_valid_from
  valid_until                         = var.ec2_fleet_valid_until
  
  dynamic "launch_template_config" {
    for_each = var.ec2_fleet_launch_template_config
      content {
        dynamic "launch_template_specification" {
          for_each = launch_template_config.value.launch_template_specification
            content {
              launch_template_id   = launch_template_specification.value["launch_template_id"]
              launch_template_name = launch_template_specification.value["launch_template_name"]
              version              = launch_template_specification.value["version"]
            }
        }             
        dynamic "override" {
          for_each = launch_template_config.value.override
            content {
              availability_zone = override.value["availability_zone"]
              instant_type      = override.value["instant_type"]
              max_price         = override.value["max_price"]
              priority          = override.value["priority"]
              subnet_id         = override.value["subnet_id"]
              weighted_capacity = override.value["weighted_capacity"]
              dynamic "instance_requirements" {
                for_each = override.value.instance_requirements
                  content {
                    accelerator_manufacturers                               = instance_requirements.value["accelerator_manufacturers"]
                    accelerator_names                                       = instance_requirements.value["accelerator_names"]
                    accelerator_types                                       = instance_requirements.value["accelerator_types"]
                    allowed_instance_types                                  = instance_requirements.value["allowed_instance_types"]
                    bare_metal                                              = instance_requirements.value["bare_metal"]
                    burstable_performance                                   = instance_requirements.value["burstable_performance"]
                    cpu_manufacturers                                       = instance_requirements.value["cpu_manufacturers"]
                    excluded_instance_types                                 = instance_requirements.value["excluded_instance_types"]
                    instance_generations                                    = instance_requirements.value["instance_generations"]
                    local_storage                                           = instance_requirements.value["local_storage"]
                    local_storage_types                                     = instance_requirements.value["local_storage_types"]
                    max_spot_price_as_percentage_of_optimal_on_demand_price = instance_requirements.value["max_spot_price_as_percentage_of_optimal_on_demand_price"]
                    on_demand_max_price_percentage_over_lowest_price        = instance_requirements.value["on_demand_max_price_percentage_over_lowest_price"]
                    require_hibernate_support                               = instance_requirements.value["require_hibernate_support"]
                    spot_max_price_percentage_over_lowest_price             = instance_requirements.value["spot_max_price_percentage_over_lowest_price"]
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
            }
        }
      }
  }
  dynamic "on_demand_options" {
    for_each = var.ec2_fleet_on_demand_options
      content {
        allocation_strategy      = on_demand_options.value["allocation_strategy"]
        max_total_price          = on_demand_options.value["max_total_price"]
        min_target_capacity      = on_demand_options.value["min_target_capacity"]
        single_availability_zone = on_demand_options.value["single_availability_zone"]
        single_instance_type     = on_demand_options.value["single_instance_type"]
        dynamic "capacity_reservation_options" {
          for_each = on_demand_options.value.capacity_reservation_options
            content {
              usage_strategy = capacity_reservation_options.value["usage_strategy"]
            }
        }
      }
  }
  dynamic "spot_options" {
    for_each = var.ec2_fleet_spot_options
      content {
        allocation_strategy            = spot_options.value["allocation_strategy"]
        instance_interruption_behavior = spot_options.value["instance_interruption_behavior"]
        instance_pools_to_use_count    = spot_options.value["instance_pools_to_use_count"]
        max_total_price                = spot_options.value["max_total_price"]
        min_target_capacity            = spot_options.value["min_target_capacity"]
        single_availability_zone       = spot_options.value["single_availability_zone"]
        single_instance_type           = spot_options.value["single_instance_type"]
        dynamic "maintenance_strategies" {
          for_each = spot_options.value.maintenance_strategies
            content {
              dynamic "capacity_rebalance" {
                for_each = maintenance_strategies.value.capacity_rebalance
                  content {
                    replacement_strategy = capacity_rebalance.value["replacement_strategy"]
                    termination_delay    = capacity_rebalance.value["termination_delay"]
                  }
              }
            }
        }
      }
  }
  dynamic "target_capacity_specification" {
    for_each = var.ec2_fleet_target_capacity_specification
      content {
        default_target_capacity_type = target_capacity_specification.value["default_target_capacity_type"]
        on_demand_target_capacity    = target_capacity_specification.value["on_demand_target_capacity"]
        spot_target_capacity         = target_capacity_specification.value["spot_target_capacity"]
        target_capacity_unit_type    = target_capacity_specification.value["target_capacity_unit_type"]
        total_target_capacity        = target_capacity_specification.value["total_target_capacity"]

      }
  }
}
