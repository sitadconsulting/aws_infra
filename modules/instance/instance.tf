resource "aws_instance" "instance" {
  ami                                  = var.instance_ami
  associate_public_ip_address          = var.instance_associate_public_ip_address
  availability_zone                    = var.instance_availability_zone
  cpu_core_count                       = var.instance_cpu_core_count
  cpu_threads_per_core                 = var.instance_cpu_threads_per_core
  disable_api_stop                     = var.instance_disable_api_stop
  disable_api_termination              = var.instance_disable_api_termination
  ebs_optimized                        = var.instance_ebs_optimized
  get_password_data                    = var.instance_get_password_data
  hibernation                          = var.instance_hibernation
  host_id                              = var.instance_host_id
  host_resource_group_arn              = var.instance_host_resource_group_arn
  iam_instance_profile                 = var.instance_iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_instance_initiated_shutdown_behavior
  instance_type                        = var.instance_instance_type
  ipv6_address_count                   = var.instance_ipv6_address_count
  ipv6_addresses                       = var.instance_ipv6_addresses
  key_name                             = var.instance_key_name
  monitoring                           = var.instance_monitoring
  placement_group                      = var.instance_placement_group
  placement_partition_number           = var.instance_placement_partition_number
  private_ip                           = var.instance_private_ip
  secondary_private_ips                = var.instance_secondary_private_ips
  security_groups                      = var.instance_security_groups
  source_dest_check                    = var.instance_source_dest_check
  subnet_id                            = var.instance_subnet_id
  tags                                 = var.instance_tags
  tenancy                              = var.instance_tenancy
  user_data                            = var.instance_user_data
  user_data_base64                     = var.instance_user_data_base64
  user_data_replace_on_change          = var.instance_user_data_replace_on_change
  volume_tags                          = var.instance_volume_tags
  vpc_security_group_ids               = var.instance_vpc_security_group_ids
  
  dynamic "capacity_reservation_specification" {
    for_each = var.instance_capacity_reservation_specification
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
    for_each = var.instance_cpu_options
      content {
        amd_sev_snp      = cpu_options.value["amd_sev_snp"]
        core_count       = cpu_options.value["core_count"]
        threads_per_core = cpu_options.value["threads_per_core"]
      }
  }
  dynamic "credit_specification" {
    for_each = var.instance_credit_specification
      content {
        cpu_credits = credit_specification.value["cpu_credits"] 
      }
  }
  dynamic "ebs_block_device" {
    for_each = var.instance_ebs_block_device
      content {
        delete_on_termination = ebs_block_device.value["delete_on_termination"]
        device_name           = ebs_block_device.value["device_name"]
        encrypted             = ebs_block_device.value["encrypted"]
        iops                  = ebs_block_device.value["iops"]
        kms_key_id            = ebs_block_device.value["kms_key_id"]
        snapshot_id           = ebs_block_device.value["snapshot_id"]
        tags                  = ebs_block_device.value["tags"]
        throughput            = ebs_block_device.value["throughput"]
        volume_size           = ebs_block_device.value["volume_size"]
        volume_type           = ebs_block_device.value["volume_type"] 
      }
  }
  dynamic "enclave_options" {
    for_each = var.instance_enclave_options
      content {
        enabled = enclave_options.value["enabled"] 
      }
  }
  dynamic "ephemeral_block_device" {
    for_each = var.instance_ephemeral_block_device
      content {
        device_name  = ephemeral_block_device.value["device_name"]
        no_device    = ephemeral_block_device.value["no_device"]
        virtual_name = ephemeral_block_device.value["virtual_name"]
      }
  }
  dynamic "launch_template" {
    for_each = var.instance_launch_template
      content {
        id      = launch_template.value["id"]
        name    = launch_template.value["name"]
        version = launch_template.value["version"]
      }
  }
  dynamic "maintenance_options" {
    for_each = var.instance_maintenance_options
      content {
        auto_recovery = maintenance_options.value["auto_recovery"] 
      }
  }
  dynamic "metadata_options" {
    for_each = var.instance_metadata_options
      content {
        http_endpoint               = metadata_options.value["http_endpoint"]
        http_put_response_hop_limit = metadata_options.value["http_put_response_hop_limit"]
        http_tokens                 = metadata_options.value["http_tokens"]
        instance_metadata_tags      = metadata_options.value["instance_metadata_tags"]
      }
  }
  dynamic "network_interface" {
    for_each = var.instance_network_interface
      content {
        delete_on_termination = network_interface.value["delete_on_termination"]
        device_index          = network_interface.value["device_index"]
        network_card_index    = network_interface.value["network_card_index"]
        network_interface_id  = network_interface.value["network_interface_id"]
      }
  }
  dynamic "private_dns_name_options" {
    for_each = var.instance_private_dns_name_options
      content {
        enable_resource_name_dns_aaaa_record = private_dns_name_options.value["enable_resource_name_dns_aaaa_record"]
        enable_resource_name_dns_a_record    = private_dns_name_options.value["enable_resource_name_dns_a_record"]
        hostname_type                        = private_dns_name_options.value["hostname_type"]
      }
  }
  dynamic "root_block_device" {
    for_each = var.instance_root_block_device
      content {
        delete_on_termination = root_block_device.value["delete_on_termination"]
        encrypted             = root_block_device.value["encrypted"]
        iops                  = root_block_device.value["iops"]
        kms_key_id            = root_block_device.value["kms_key_id"]
        tags                  = root_block_device.value["tags"]
        throughput            = root_block_device.value["throughput"]
        volume_size           = root_block_device.value["volume_size"]
        volume_type           = root_block_device.value["volume_type"]
      }
  }
  lifecycle {
    ignore_changes = all
  }
}
