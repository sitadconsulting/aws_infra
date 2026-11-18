resource "aws_emr_instance_fleet" "emr_instance_fleet" {
  cluster_id                = var.emr_instance_fleet_cluster_id
  name                      = var.emr_instance_fleet_name
  target_on_demand_capacity = var.emr_instance_fleet_target_on_demand_capacity 
  target_spot_capacity      = var.emr_instance_fleet_target_spot_capacity

  dynamic "instance_type_configs" {
    for_each = var.emr_instance_fleet_instance_type_configs
      content {
        bid_price                                  = instance_type_configs.value["bid_price"]
        bid_price_as_percentage_of_on_demand_price = instance_type_configs.value["bid_price_as_percentage_of_on_demand_price"]
        instance_type                              = instance_type_configs.value["instance_type"]
        weighted_capacity                          = instance_type_configs.value["weighted_capacity"]
        dynamic "configurations" {
          for_each = instance_type_configs.value.configurations
            content {
              classification = configurations.value["classification"]
              properties     = configurations.value["properties"]
            }
        } 
        dynamic "ebs_config" {
          for_each = instance_type_configs.value.ebs_config
            content {
              iops                 = ebs_config.value["iops"]
              size                 = ebs_config.value["size"]
              type                 = ebs_config.value["type"]
              volumes_per_instance = ebs_config.value["volumes_per_instance"]
            } 
        }
      }
  }
  dynamic "launch_specifications" {
    for_each = var.emr_instance_fleet_launch_specifications
      content {
        dynamic "on_demand_specification" {
          for_each = launch_specifications.value.on_demand_specification
            content {
              allocation_strategy = on_demand_specification.value["allocation_strategy"]
            }
        }
        dynamic "spot_specification" {
          for_each = launch_specifications.value.spot_specification
            content {
              allocation_strategy      = spot_specification.value["allocation_strategy"]
              block_duration_minutes   = spot_specification.value["block_duration_minutes"]
              timeout_action           = spot_specification.value["timeout_action"]
              timeout_duration_minutes = spot_specification.value["timeout_duration_minutes"]
            }
        }
      }
  }
}
