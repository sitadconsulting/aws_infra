resource "aws_launch_configuration" "launch_configuration" {
  associate_public_ip_address = var.launch_configuration_associate_public_ip_address
  ebs_optimized               = var.launch_configuration_ebs_optimized
  enable_monitoring           = var.launch_configuration_enable_monitoring
  iam_instance_profile        = var.launch_configuration_iam_instance_profile
  image_id                    = var.launch_configuration_image_id
  instance_type               = var.launch_configuration_instance_type
  key_name                    = var.launch_configuration_key_name
  name                        = var.launch_configuration_name
  name_prefix                 = var.launch_configuration_name_prefix
  placement_tenancy           = var.launch_configuration_placement_tenancy
  security_groups             = var.launch_configuration_security_groups
  spot_price                  = var.launch_configuration_spot_price
  user_data                   = var.launch_configuration_user_data
  user_data_base64            = var.launch_configuration_user_data_base64
  
  dynamic "ebs_block_device" {
    for_each = var.launch_configuration_ebs_block_device
      content {
        delete_on_termination = ebs_block_device.value["delete_on_termination"]
        device_name           = ebs_block_device.value["device_name"]
        encrypted             = ebs_block_device.value["encrypted"]
        iops                  = ebs_block_device.value["iops"]
        no_device             = ebs_block_device.value["no_device"]
        snapshot_id           = ebs_block_device.value["snapshot_id"]
        throughput            = ebs_block_device.value["throughput"]
        volume_size           = ebs_block_device.value["volume_size"]
        volume_type           = ebs_block_device.value["volume_type"]
      }
  }
  dynamic "ephemeral_block_device" {
    for_each = var.launch_configuration_ephemeral_block_device
      content {
        device_name  = ephemeral_block_device.value["device_name"]
        no_device    = ephemeral_block_device.value["no_device"]
        virtual_name = ephemeral_block_device.value["virtual_name"]
      }
  }
  dynamic "metadata_options" {
    for_each = var.launch_configuration_metadata_options
      content {
        http_endpoint               = metadata_options.value["http_endpoint"]
        http_put_response_hop_limit = metadata_options.value["http_put_response_hop_limit"]
        http_tokens                 = metadata_options.value["http_tokens"]
      }
  }
  dynamic "root_block_device" {
    for_each = var.launch_configuration_root_block_device
      content {
        delete_on_termination = root_block_device.value["delete_on_termination"]
        encrypted             = root_block_device.value["encrypted"]
        iops                  = root_block_device.value["iops"]
        throughput            = root_block_device.value["throughput"]
        volume_size           = root_block_device.value["volume_size"]
        volume_type           = root_block_device.value["volume_type"]
      }
  }
  
}
