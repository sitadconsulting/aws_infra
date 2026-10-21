resource "aws_ami" "ami" {
  architecture        = var.ami_architecture
  boot_mode           = var.ami_boot_mode
  deprecation_time    = var.ami_deprecation_time
  description         = var.ami_description
  ena_support         = var.ami_ena_support
  image_location      = var.ami_image_location
  imds_support        = var.ami_imds_support
  kernel_id           = var.ami_kernel_id
  name                = var.ami_name
  ramdisk_id          = var.ami_ramdisk_id
  root_device_name    = var.ami_root_device_name
  sriov_net_support   = var.ami_sriov_net_support
  tags                = var.ami_tags
  tpm_support         = var.ami_tpm_support
  uefi_data           = var.ami_uefi_data
  virtualization_type = var.ami_virtualization_type


  dynamic "ebs_block_device" {
    for_each = var.ami_ebs_block_device
      content {
        device_name            = ebs_block_device.value["device_name"]
        delete_on_termination  = ebs_block_device.value["delete_on_termination"]
        encrypted              = ebs_block_device.value["encrypted"] 
        iops                   = ebs_block_device.value["iops"]
        snapshot_id            = ebs_block_device.value["snapshot_id"]
        throughput             = ebs_block_device.value["throughput"]
        volume_size            = ebs_block_device.value["volume_size"]
        volume_type            = ebs_block_device.value["volume_type"]
        outpost_arn            = ebs_block_device.value["outpost_arn"]
      }
  }
  dynamic "ephemeral_block_device" {
    for_each = var.ami_ephemeral_block_device
      content {
        device_name  = ephemeral_block_device.value["device_name"]
        virtual_name = ephemeral_block_device.value["virtual_name"]
      }
  }
}
