resource "aws_launch_template" "launch_template" {
  default_version                      = var.launch_template_default_version
  description                          = var.launch_template_description
  disable_api_stop                     = var.launch_template_disable_api_stop
  disable_api_termination              = var.launch_template_disable_api_termination
  ebs_optimized                        = var.launch_template_ebs_optimized
  image_id                             = var.launch_template_image_id
  instance_initiated_shutdown_behavior = var.launch_template_instance_initiated_shutdown_behavior
  instance_type                        = var.launch_template_instance_type
  kernel_id                            = var.launch_template_kernel_id
  key_name                             = var.launch_template_key_name
  name                                 = var.launch_template_name 
  name_prefix                          = var.launch_template_name_prefix
  ram_disk_id                          = var.launch_template_ram_disk_id
  security_group_names                 = var.launch_template_security_group_names
  user_data                            = var.launch_template_user_data
  vpc_security_group_ids               = var.launch_template_vpc_security_group_ids


  dynamic "block_device_mappings" {
    for_each = var.launch_template_block_device_mappings
      content {
        device_name  = block_device_mappings.value["device_name"]
        no_device    = block_device_mappings.value["no_device"]
        virtual_name = block_device_mappings.value["virtual_name"]
        dynamic "ebs" {
          for_each = block_device_mappings.value.ebs
            content {
              delete_on_termination = ebs.value["delete_on_termination"]
              encrypted             = ebs.value["encrypted"]
              iops                  = ebs.value["iops"]
              kms_key_id            = ebs.value["kms_key_id"]
              snapshot_id           = ebs.value["snapshot_id"]
              throughput            = ebs.value["throughput"]
              volume_size           = ebs.value["volume_size"]
              volume_type           = ebs.value["volume_type"]
            }
        }  
      } 
  }
  dynamic "capacity_reservation_specification" {
    for_each = var.launch_template_capacity_reservation_specification
      content {
        capacity_reservation_preference = capacity_reservation_specification.value["capacity_reservation_preference"]
        dynamic "capacity_reservation_target" {
          for_each = capacity_reservation_specification.value.capacity_reservation_target
            content {
              capacity_reservation_id                 = capacity_reservation_target.value["capacity_reservation_id"]
              capacity_reservation_resource_group_arn = capacity_reservation_target.value["capacity_reservation_resource_group_arn"]
            }
        }
      }
  }
  dynamic "cpu_options" {
    for_each = var.launch_template_cpu_options
      content {
        #amd_sev_snp      = cpu_options.value["amd_sev_snp"]
        core_count       = cpu_options.value["core_count"]
        threads_per_core = cpu_options.value["threads_per_core"]
      } 
  }
  dynamic "credit_specification" {
    for_each = var.launch_template_credit_specification
      content {
        cpu_credits = credit_specification.value["cpu_credits"]
      }
  }
  dynamic "elastic_gpu_specifications" {
    for_each = var.launch_template_elastic_gpu_specifications
      content {
        type = elastic_gpu_specifications.value["type"]
      }
  }
  dynamic "elastic_inference_accelerator" {
    for_each = var.launch_template_elastic_inference_accelerator
      content {
        type = elastic_inference_accelerator.value["type"]
      }
  }
  dynamic "enclave_options" {
    for_each = var.launch_template_enclave_options
      content {
        enabled = enclave_options.value["enabled"]
      }
  }
  dynamic "hibernation_options" {
    for_each = var.launch_template_hibernation_options
      content {
        configured = hibernation_options.value["configured"]
      }
  }
  dynamic "iam_instance_profile" {
    for_each = var.launch_template_iam_instance_profile
      content {
        arn   = iam_instance_profile.value["arn"]
        name  = iam_instance_profile.value["name"]
      }
  } 
  dynamic "instance_market_options" {
    for_each = var.launch_template_instance_market_options
      content  {
        market_type = instance_market_options.value["market_type"]
        dynamic "spot_options" {
          for_each = instance_market_options.value.spot_options
            content {
              block_duration_minutes         = spot_options.value["block_duration_minutes"]
              instance_interruption_behavior = spot_options.value["instance_interruption_behavior"]
              max_price                      = spot_options.value["max_price"]
              spot_instance_type             = spot_options.value["spot_instance_type"]
              valid_until                    = spot_options.value["valid_until"]
            }
        }
      }
  }
  dynamic "instance_requirements" {
    for_each = var.launch_template_instance_requirements
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
  dynamic "license_specification" {
    for_each = var.launch_template_license_specification
      content {
        license_configuration_arn = license_specification.value["license_configuration_arn"]
      }
  }
  dynamic "maintenance_options" {
    for_each = var.launch_template_maintenance_options
      content {
        auto_recovery = maintenance_options.value["auto_recovery"]
      }
  }
  dynamic "metadata_options" {
    for_each = var.launch_template_metadata_options
    content {
      http_endpoint                = metadata_options.value["http_endpoint"]
      http_protocol_ipv6           = metadata_options.value["http_protocol_ipv6"]
      http_put_response_hop_limit  = metadata_options.value["http_put_response_hop_limit"]
      http_tokens                  = metadata_options.value["http_tokens"]
      instance_metadata_tags       = metadata_options.value["instance_metadata_tags"] 
    } 
  }
  dynamic "monitoring" {
    for_each = var.launch_template_monitoring
      content {
        enabled = monitoring.value["enabled"]
      }
  }
  dynamic "network_interfaces" {
    for_each = var.launch_template_network_interfaces
      content {
        associate_carrier_ip_address = network_interfaces.value["associate_carrier_ip_address"]
        associate_public_ip_address  = network_interfaces.value["associate_public_ip_address"]
        delete_on_termination        = network_interfaces.value["delete_on_termination"]
        description                  = network_interfaces.value["description"]
        device_index                 = network_interfaces.value["device_index"]
        interface_type               = network_interfaces.value["interface_type"]
        ipv4_address_count           = network_interfaces.value["ipv4_address_count"]
        ipv4_addresses               = network_interfaces.value["ipv4_addresses"]
        ipv4_prefix_count            = network_interfaces.value["ipv4_prefix_count"]
        ipv4_prefixes                = network_interfaces.value["ipv4_prefixes"]
        ipv6_address_count           = network_interfaces.value["ipv6_address_count"]
        ipv6_addresses               = network_interfaces.value["ipv6_addresses"]
        ipv6_prefix_count            = network_interfaces.value["ipv6_prefix_count"]
        ipv6_prefixes                = network_interfaces.value["ipv6_prefixes"]
        network_card_index           = network_interfaces.value["network_card_index"]
        network_interface_id         = network_interfaces.value["network_interface_id"]
        private_ip_address           = network_interfaces.value["private_ip_address"]
        security_groups              = network_interfaces.value["security_groups"]
        subnet_id                    = network_interfaces.value["subnet_id"]
      }
  }
  dynamic "placement" {
    for_each = var.launch_template_placement
      content {
        affinity                = placement.value["affinity"]
        availability_zone       = placement.value["availability_zone"]
        group_name              = placement.value["group_name"]
        host_id                 = placement.value["host_id"]
        host_resource_group_arn = placement.value["host_resource_group_arn"]
        partition_number        = placement.value["partition_number"]
        spread_domain           = placement.value["spread_domain"]
        tenancy                 = placement.value["tenancy"]
      }
  }
  dynamic "private_dns_name_options" {
    for_each = var.launch_template_private_dns_name_options
      content {
        enable_resource_name_dns_aaaa_record = private_dns_name_options.value["enable_resource_name_dns_aaaa_record"]
        enable_resource_name_dns_a_record    = private_dns_name_options.value["enable_resource_name_dns_a_record"]
        hostname_type                        = private_dns_name_options.value["hostname_type"]
      }
  }
  dynamic "tag_specifications" {
    for_each = var.launch_template_tag_specifications
      content {
        resource_type   = tag_specifications.value["resource_type"]
        tags            = tag_specifications.value["tags"]
      }             
  }
  lifecycle {
    ignore_changes = all
  }
}
